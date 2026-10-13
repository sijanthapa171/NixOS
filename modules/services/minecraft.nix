/*
  minecraft.nix — Minecraft game server module.

  Features:
    • Runs the server as a dedicated systemd service (minecraft-server)
    • Supports vanilla / fabric / paper / forge via `serverType` variable
    • JVM tuned with Aikar flags for low GC pauses
    • RCON enabled for remote admin (mcrcon CLI in host-packages)
    • Automatic daily world backup via systemd timer → /srv/minecraft/backups/
    • Firewall opens Minecraft (25565) and RCON (25575) ports

  Firewall ports opened:
    25565 TCP+UDP — Minecraft game traffic
    25575 TCP     — RCON (remote console)
    25565 UDP     — Query protocol (server list pings)
*/
{
  host,
  pkgs,
  lib,
  ...
}:
let
  vars = import ../../hosts/${host}/variables.nix;
  inherit (vars)
    username
    serverDir
    mcPort
    rconPort
    rconPassword
    jvmInitHeap
    jvmMaxHeap
    maxPlayers
    mcVersion
    serverType
    enableQuery
    ;

  jvmFlags = [
    "-Xms${jvmInitHeap}"
    "-Xmx${jvmMaxHeap}"
    "-XX:+UseG1GC"
    "-XX:+ParallelRefProcEnabled"
    "-XX:MaxGCPauseMillis=200"
    "-XX:+UnlockExperimentalVMOptions"
    "-XX:+DisableExplicitGC"
    "-XX:+AlwaysPreTouch"
    "-XX:G1NewSizePercent=30"
    "-XX:G1MaxNewSizePercent=40"
    "-XX:G1HeapRegionSize=8M"
    "-XX:G1ReservePercent=20"
    "-XX:G1HeapWastePercent=5"
    "-XX:G1MixedGCCountTarget=4"
    "-XX:InitiatingHeapOccupancyPercent=15"
    "-XX:G1MixedGCLiveThresholdPercent=90"
    "-XX:G1RSetUpdatingPauseTimePercent=5"
    "-XX:SurvivorRatio=32"
    "-XX:+PerfDisableSharedMem"
    "-XX:MaxTenuringThreshold=1"
    "-Dusing.aikars.flags=https://mcflags.emc.gs"
    "-Daikars.new.flags=true"
  ];

  jvmFlagsStr = lib.concatStringsSep " " jvmFlags;

  serverJar = {
    vanilla = "server.jar";
    fabric = "fabric-server-launch.jar";
    paper = "paper.jar";
    forge = "forge-server.jar";
  }.${serverType} or "server.jar";

  serverProperties = pkgs.writeText "server.properties" ''
    #Minecraft server properties
    server-port=${toString mcPort}
    enable-rcon=true
    rcon.port=${toString rconPort}
    rcon.password=${rconPassword}
    enable-query=${if enableQuery then "true" else "false"}
    query.port=${toString mcPort}
    max-players=${toString maxPlayers}
    online-mode=true
    difficulty=normal
    gamemode=survival
    level-name=world
    motd=A NixOS Minecraft Server
    view-distance=10
    simulation-distance=10
    allow-flight=false
    spawn-protection=16
    white-list=false
    enforce-whitelist=false
  '';

  backupScript = pkgs.writeShellApplication {
    name = "minecraft-backup";
    runtimeInputs = with pkgs; [
      mcrcon
      rsync
      zstd
    ];
    text = ''
      set -euo pipefail

      WORLD_DIR="${serverDir}/world"
      BACKUP_DIR="${serverDir}/backups"
      TIMESTAMP=$(date +%Y%m%d_%H%M%S)
      ARCHIVE="$BACKUP_DIR/world_$TIMESTAMP.tar.zst"

      mkdir -p "$BACKUP_DIR"

      echo "Notifying players of backup..."
      mcrcon -H 127.0.0.1 -P ${toString rconPort} -p "${rconPassword}" \
        "say [Backup] Saving world — expect brief lag..." || true

      echo "Saving world via RCON..."
      mcrcon -H 127.0.0.1 -P ${toString rconPort} -p "${rconPassword}" \
        "save-off" "save-all" || true

      sleep 3

      echo "Archiving $WORLD_DIR → $ARCHIVE"
      tar --use-compress-program="zstd -T0 -3" -cf "$ARCHIVE" -C "${serverDir}" world

      echo "Re-enabling auto-save..."
      mcrcon -H 127.0.0.1 -P ${toString rconPort} -p "${rconPassword}" \
        "save-on" \
        "say [Backup] Done: world_$TIMESTAMP.tar.zst" || true

      # Keep only the 14 most recent backups
      ls -tp "$BACKUP_DIR"/world_*.tar.zst 2>/dev/null \
        | tail -n +15 \
        | xargs -r rm --

      echo "Backup complete: $ARCHIVE"
    '';
  };

in
{
  networking.firewall = {
    allowedTCPPorts = [
      mcPort
      rconPort
    ];
    allowedUDPPorts = [ mcPort ];
  };

  systemd.tmpfiles.rules = [
    "d ${serverDir}          0750 ${username} users - -"
    "d ${serverDir}/backups  0750 ${username} users - -"
    "d ${serverDir}/mods     0750 ${username} users - -"
    "d ${serverDir}/plugins  0750 ${username} users - -"
  ];

  system.activationScripts.minecraftServerProperties = {
    text = ''
      cp --no-preserve=mode ${serverProperties} ${serverDir}/server.properties
      chown ${username}:users ${serverDir}/server.properties
    '';
    deps = [ "users" ];
  };

  system.activationScripts.minecraftEula = {
    text = ''
      echo "eula=true" > ${serverDir}/eula.txt
      chown ${username}:users ${serverDir}/eula.txt
    '';
    deps = [ "users" ];
  };

  systemd.services.minecraft-server = {
    description = "Minecraft ${serverType} server (${mcVersion})";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    environment = {
      JAVA_HOME = "${pkgs.jdk21}";
    };

    serviceConfig = {
      Type = "simple";
      User = username;
      Group = "users";
      WorkingDirectory = serverDir;

      ExecStart = "${pkgs.jdk21}/bin/java ${jvmFlagsStr} -jar ${serverDir}/${serverJar} nogui";

      ExecStop = "${pkgs.mcrcon}/bin/mcrcon -H 127.0.0.1 -P ${toString rconPort} -p ${rconPassword} stop";
      TimeoutStopSec = 60;

      Restart = "on-failure";
      RestartSec = "10s";

      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      ProtectHome = "read-only";
      ReadWritePaths = [ serverDir ];

      LimitNOFILE = 65535;
    };

    preStart = ''
      if [ ! -f "${serverDir}/${serverJar}" ]; then
        echo "ERROR: ${serverDir}/${serverJar} not found."
        echo "Download the ${serverType} ${mcVersion} server jar and place it at:"
        echo "  ${serverDir}/${serverJar}"
        exit 1
      fi
    '';
  };

  systemd.services.minecraft-backup = {
    description = "Minecraft world backup";
    serviceConfig = {
      Type = "oneshot";
      User = username;
      ExecStart = lib.getExe backupScript;
    };
  };

  systemd.timers.minecraft-backup = {
    description = "Daily Minecraft world backup";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true; # run missed backup if server was off
      RandomizedDelaySec = "5min";
    };
  };

  environment.systemPackages = [ pkgs.jdk21 pkgs.mcrcon ];
}
