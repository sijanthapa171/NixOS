{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.trok;
  trokPackage = pkgs.callPackage ./package.nix {};
in
{
  options.modules.programs.pkg.trok = {
    enable = mkEnableOption "trok";
    
    # Server configuration options
    server = {
      enable = mkEnableOption "trok server";
      
      host = mkOption {
        type = types.str;
        default = "0.0.0.0";
        description = "Host address for the trok server to listen on";
      };

      port = mkOption {
        type = types.port;
        default = 1337;
        description = "Port number for the trok server to listen on";
      };

      openFirewall = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to open the firewall for trok server";
      };

      user = mkOption {
        type = types.str;
        default = "trok";
        description = "User account under which the trok server runs";
      };

      group = mkOption {
        type = types.str;
        default = "trok";
        description = "Group under which the trok server runs";
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      environment.systemPackages = [
        trokPackage
      ];
    })

    (mkIf cfg.server.enable {
      # Create system user and group if server is enabled
      users.users.${cfg.server.user} = {
        isSystemUser = true;
        group = cfg.server.group;
        description = "Trok server daemon user";
      };

      users.groups.${cfg.server.group} = {};

      # Systemd service for trok server
      systemd.services.trok-server = {
        description = "Trok Server Daemon";
        wantedBy = ["multi-user.target"];
        after = ["network.target"];

        serviceConfig = {
          ExecStart = "${trokPackage}/bin/trok server -h ${cfg.server.host} -p ${toString cfg.server.port}";
          User = cfg.server.user;
          Group = cfg.server.group;
          Restart = "always";
          RestartSec = "10";
        };
      };

      # Open firewall if enabled
      networking.firewall = mkIf cfg.server.openFirewall {
        allowedTCPPorts = [ cfg.server.port ];
      };
    })
  ];
} 