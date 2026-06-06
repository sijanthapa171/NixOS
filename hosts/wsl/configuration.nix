{ inputs, ... }:
let
  vars = import ./variables.nix;
in
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ./host-packages.nix

    ../../modules/core/bash.nix
    ../../modules/core/zsh.nix
    ../../modules/core/starship.nix
    ../../modules/core/nh.nix
    ../../modules/core/system.nix
    ../../modules/core/users.nix
    ../../modules/core/packages.nix
    ../../modules/programs/editor/${vars.editor}
    ../../modules/programs/cli/lazygit/default.nix
    ../../modules/programs/cli/tmux/default.nix
    ../../modules/programs/cli/btop/default.nix
  ];

  wsl = {
    enable = true;
    defaultUser = vars.username;
  };

  networking.hostName = vars.hostname;

  nixpkgs.config.allowUnfree = true;
}
