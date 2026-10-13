/*
  server/configuration.nix

  A headless NixOS host for deploying fullstack web applications.

  Stack:
    • nginx  (reverse proxy + TLS via Let's Encrypt)
    • PostgreSQL 16
    • Redis
    • Docker
    • OpenSSH

  To deploy:
    nixos-rebuild switch --flake .#server --target-host root@<server-ip>

  After first boot, set real passwords / secrets in:
    /srv/app/backend/.env   (DATABASE_URL, REDIS_URL, SECRET_KEY, ...)
    /srv/app/frontend/.env.local

  Enable the systemd stubs in modules/services/fullstack.nix once your
  build artefacts are in place.
*/
{ ... }:
let
  vars = import ./variables.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    ./host-packages.nix

    # ── Core system ─────────────────────────────────────────────────────────
    ../../modules/core/boot.nix
    ../../modules/core/bash.nix
    ../../modules/core/zsh.nix
    ../../modules/core/starship.nix
    ../../modules/core/network.nix
    ../../modules/core/dns.nix
    ../../modules/core/nh.nix
    ../../modules/core/packages.nix
    ../../modules/core/security.nix
    ../../modules/core/system.nix
    ../../modules/core/users.nix
    ../../modules/core/virtualisation.nix # Docker + libvirtd

    # ── Programs ────────────────────────────────────────────────────────────
    ../../modules/programs/editor/${vars.editor}
    ../../modules/programs/cli/tmux
    ../../modules/programs/cli/direnv
    ../../modules/programs/cli/lazygit
    ../../modules/programs/cli/btop
    ../../modules/programs/cli/fastfetch

    # ── Fullstack services ───────────────────────────────────────────────────
    ../../modules/services/fullstack.nix
  ];

  networking.hostName = vars.hostname;

  nixpkgs.config.allowUnfree = true;
}
