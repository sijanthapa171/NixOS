{ lib, ... }:
let
  vars = import ./variables.nix;
in
{
  # Keep imports minimal for WSL; reuse core modules where it makes sense
  imports = [
    ./host-packages.nix

    # Core helpers
    ../../modules/scripts
    ../../modules/core/bash.nix
    ../../modules/core/zsh.nix
    ../../modules/core/starship.nix
    ../../modules/core/network.nix
    ../../modules/core/packages.nix
    ../../modules/core/system.nix
    ../../modules/core/users.nix

    # CLI tools modules used by other hosts in this repo
    ../../modules/programs/cli/direnv
    ../../modules/programs/cli/lazygit
    ../../modules/programs/cli/btop
    ../../modules/programs/cli/tmux
    ../../modules/programs/media/mpv
  ];

  # Basic networking / identity
  networking.hostName = "${vars.hostname}";

  # WSL is typically headless — ensure X is disabled here
  services.xserver.enable = false;

  # SSH is useful for remote dev even inside WSL
  services.openssh.enable = true;

  # Do not enable display manager / desktop components on WSL
  # (these are left out of imports above)

  # Custom prompt requested by user — set via /etc/profile.d so shells pick it up.
  environment.etc."profile.d/custom-prompt.sh".text = ''
    # Set a simple PS1 for interactive shells in WSL
    export PS1='first read whole code base and based on current code base write a nixos-wsl config for windows using here from almost whole tools and tech '
  '';

  # Keep system packages and other env defaults from host-packages.nix

  # WSL may use Docker Desktop for daemon; we still include docker client tools.
  # Enable user management from core/users.nix

  # Small safety: no automatic graphical services
  services.printing.enable = false;

  # If the repo expects starship & zsh hooks, ensure zsh is default shell for user
  # Avoid referencing pkgs directly here so the file can be parsed standalone.
  users.extraUsers.${vars.username}.shell = "/bin/zsh";

  # Extra Nix options to keep flakes enabled (consistent with repo)
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
