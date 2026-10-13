/*
  minecraft/configuration.nix

  Headless NixOS host for running a Minecraft game server.

  Stack:
    • Java 21 (required for Minecraft 1.21+)
    • minecraft-server systemd service (fabric / paper / vanilla / forge)
    • Aikar JVM GC flags for low-latency gameplay
    • RCON for remote admin
    • Automatic daily world backups with zstd compression

  To deploy:
    nixos-rebuild switch --flake .#minecraft --target-host root@<server-ip>

  After deploy, place the server jar at:
    /srv/minecraft/<serverJar>   (see variables.nix → serverType)

  Then start the service:
    systemctl start minecraft-server
    systemctl status minecraft-server

  Connect via RCON:
    mcrcon -H localhost -P 25575 -p <rconPassword> "list"
*/
{ ... }:
let
  vars = import ./variables.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    ./host-packages.nix

    ../../modules/core/boot.nix
    ../../modules/core/bash.nix
    ../../modules/core/zsh.nix
    ../../modules/core/starship.nix
    ../../modules/core/network.nix
    ../../modules/core/nh.nix
    ../../modules/core/packages.nix
    ../../modules/core/security.nix
    ../../modules/core/system.nix
    ../../modules/core/users.nix

    ../../modules/programs/editor/${vars.editor}
    ../../modules/programs/cli/tmux
    ../../modules/programs/cli/btop
    ../../modules/programs/cli/fastfetch

    ../../modules/services/minecraft.nix
  ];

  networking.hostName = vars.hostname;

  nixpkgs.config.allowUnfree = true;
}
