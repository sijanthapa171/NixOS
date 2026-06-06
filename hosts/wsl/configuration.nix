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
    ../../modules/programs/editor/${vars.editor}
  ];

  wsl = {
    enable = true;
    defaultUser = vars.username;
  };

  networking.hostName = vars.hostname;

  nixpkgs.config.allowUnfree = true;
}
