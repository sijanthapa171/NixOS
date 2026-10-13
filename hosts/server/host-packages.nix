{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Version control & build tools
    git
    gnumake
    curl
    wget
    jq
    htop

    # Container management
    lazydocker
    docker-compose
    docker-client

    # Database clients
    postgresql # psql CLI
    redis # redis-cli

    # JavaScript / TypeScript runtimes
    nodejs_22
    bun
    pnpm

    # Process managers / reverse-proxy helpers
    caddy # optional second reverse-proxy / file server

    # Secrets / environment
    sops
    age
  ];
}
