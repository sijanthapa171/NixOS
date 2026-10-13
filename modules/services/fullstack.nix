/*
  fullstack.nix — Fullstack web application server module.

  Provides:
    • nginx  – reverse proxy with HTTP→HTTPS redirect and Let's Encrypt TLS
    • PostgreSQL – primary database
    • Redis  – session store / cache / queue
    • Docker – optional container runtime for services that ship as images

  Usage:
    Import this module in a host's configuration.nix and override the variables
    below via `services.fullstack.*` or by editing this file directly.

  Firewall ports opened automatically:
    80   – HTTP (redirected to HTTPS by nginx)
    443  – HTTPS
    22   – SSH (already open via services.nix)
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
    domain
    frontendPort
    backendPort
    dbPort
    ;
in
{
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
    ];
  };

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    port = dbPort;
    settings = {
      listen_addresses = "127.0.0.1"; # only local; nginx/app talks over loopback
      max_connections = 100;
      shared_buffers = "256MB";
      effective_cache_size = "768MB";
      maintenance_work_mem = "64MB";
      checkpoint_completion_target = 0.9;
      wal_buffers = "16MB";
      default_statistics_target = 100;
    };
    authentication = lib.mkForce ''
      # TYPE  DATABASE  USER  ADDRESS        METHOD
      local   all       all                  trust
      host    all       all   127.0.0.1/32   scram-sha-256
    '';
    initialScript = pkgs.writeText "pg-init.sql" ''
      DO $$
      BEGIN
        IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'appuser') THEN
          CREATE ROLE appuser WITH LOGIN PASSWORD 'changeme' CREATEDB;
        END IF;
      END
      $$;
      CREATE DATABASE appdb OWNER appuser;
    '';
    ensureDatabases = [ "appdb" ];
    ensureUsers = [
      {
        name = "appuser";
        ensureDBOwnership = true;
        ensureClauses = {
          login = true;
        };
      }
    ];
  };

  # Keep postgres data on a predictable path and open its systemd unit to
  # allow the app services to declare `After = postgresql.service`.
  systemd.services.postgresql.serviceConfig = {
    Restart = "on-failure";
    RestartSec = "5s";
  };

  services.redis.servers.main = {
    enable = true;
    bind = "127.0.0.1";
    port = 6379;
    requirePass = "changeme_redis"; # override in a secrets file
    settings = {
      maxmemory = "256mb";
      maxmemory-policy = "allkeys-lru";
      appendonly = "yes";
    };
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    # Global TLS security
    sslCiphers = "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384";

    virtualHosts = {
      "${domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString frontendPort}";
          proxyWebsockets = true; # Required for HMR / WS in SSR frameworks
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
          '';
        };
      };

      "api.${domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/api/" = {
          proxyPass = "http://127.0.0.1:${toString backendPort}/";
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_read_timeout 120s;
            proxy_send_timeout 120s;
          '';
        };
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString backendPort}/";
        };
      };
    };
  };

  security.acme = {
    acceptTerms = true; # already set in security.nix but repeated here for clarity
    defaults.email = "your-email@${domain}";
  };

  users.users.${username}.extraGroups = lib.mkAfter [ "docker" ];


  systemd.services.fullstack-frontend = {
    description = "Fullstack – frontend application";
    after = [
      "network.target"
      "postgresql.service"
    ];
    wantedBy = [ "multi-user.target" ];
    environment = {
      NODE_ENV = "production";
      PORT = toString frontendPort;
    };
    serviceConfig = {
      Type = "simple";
      User = username;
      WorkingDirectory = "/srv/app/frontend";
      ExecStart = "${pkgs.nodejs_22}/bin/node /srv/app/frontend/server.js";
      Restart = "on-failure";
      RestartSec = "5s";
      NoNewPrivileges = true;
      ProtectSystem = "strict";
      ProtectHome = "read-only";
      PrivateTmp = true;
      ReadWritePaths = [ "/srv/app/frontend" ];
    };
    enable = false;
  };

  systemd.services.fullstack-backend = {
    description = "Fullstack – backend API";
    after = [
      "network.target"
      "postgresql.service"
      "redis-main.service"
    ];
    wantedBy = [ "multi-user.target" ];
    environment = {
      PORT = toString backendPort;
      DATABASE_URL = "postgresql://appuser:changeme@127.0.0.1:${toString dbPort}/appdb";
      REDIS_URL = "redis://:changeme_redis@127.0.0.1:6379";
    };
    serviceConfig = {
      Type = "simple";
      User = username;
      WorkingDirectory = "/srv/app/backend";
      ExecStart = "/srv/app/backend/server";
      Restart = "on-failure";
      RestartSec = "5s";
      NoNewPrivileges = true;
      ProtectSystem = "strict";
      ProtectHome = "read-only";
      PrivateTmp = true;
      ReadWritePaths = [ "/srv/app/backend" ];
    };
    enable = false;
  };
}
