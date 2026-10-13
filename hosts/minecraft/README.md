# Minecraft Host

Headless NixOS host for running a Minecraft game server.

## Stack

| Component | Details |
|---|---|
| **Java** | JDK 21 (required for 1.21+) |
| **Server type** | Fabric (configurable: vanilla / paper / forge) |
| **JVM flags** | Aikar's optimised G1GC flags |
| **Admin** | RCON via `mcrcon` |
| **Backups** | Daily zstd-compressed world snapshots |

## Configuration

All tunable settings are in `variables.nix`:

| Variable | Default | Description |
|---|---|---|
| `serverType` | `"fabric"` | `vanilla` / `fabric` / `paper` / `forge` |
| `mcVersion` | `"1.21.1"` | Minecraft version (informational) |
| `jvmInitHeap` | `"2G"` | JVM `-Xms` |
| `jvmMaxHeap` | `"6G"` | JVM `-Xmx` |
| `mcPort` | `25565` | Game port |
| `rconPort` | `25575` | RCON port |
| `rconPassword` | `"changeme_rcon"` | **Change before deploying!** |
| `serverDir` | `"/srv/minecraft"` | Server data directory |
| `maxPlayers` | `20` | Max concurrent players |

## Deploy

**1. Change the RCON password** in `variables.nix`:
```nix
rconPassword = "your-strong-password";
```

**2. Generate hardware config on the target machine:**
```bash
nixos-generate-config --show-hardware-config > hosts/minecraft/hardware-configuration.nix
```

**3. Deploy:**
```bash
nixos-rebuild switch --flake .#minecraft --target-host root@<server-ip>
```

**4. Place the server jar:**

Download the correct jar for your `serverType` and drop it in `/srv/minecraft/`:

| Type | Expected filename |
|---|---|
| vanilla | `server.jar` |
| fabric | `fabric-server-launch.jar` |
| paper | `paper.jar` |
| forge | `forge-server.jar` |

```bash
# Example — Fabric installer
curl -LO https://meta.fabricmc.net/v2/versions/loader/1.21.1/<loader>/<installer>/server/jar
mv *.jar /srv/minecraft/fabric-server-launch.jar
```

**5. Start the server:**
```bash
systemctl start minecraft-server
systemctl status minecraft-server
journalctl -u minecraft-server -f
```

## RCON Admin

```bash
# Interactive RCON session
mcrcon -H localhost -P 25575 -p <rconPassword>

# One-off commands
mcrcon -H localhost -P 25575 -p <rconPassword> "list"
mcrcon -H localhost -P 25575 -p <rconPassword> "say Hello!"
mcrcon -H localhost -P 25575 -p <rconPassword> "stop"
```

## Backups

Worlds are backed up automatically every day at midnight to:
```
/srv/minecraft/backups/world_YYYYMMDD_HHMMSS.tar.zst
```

- Auto-save is paused during backup to avoid corruption
- Players are notified in-game before and after
- The 14 most recent backups are kept; older ones are deleted automatically

Run a manual backup anytime:
```bash
systemctl start minecraft-backup
```

## Ports

| Port | Protocol | Purpose |
|---|---|---|
| `25565` | TCP + UDP | Minecraft game traffic |
| `25575` | TCP | RCON remote console |

## Mods / Plugins

Drop files into the appropriate directory:
```
/srv/minecraft/mods/     ← Fabric / Forge mods (.jar)
/srv/minecraft/plugins/  ← Paper plugins (.jar)
```

Restart the server after adding mods:
```bash
systemctl restart minecraft-server
```
