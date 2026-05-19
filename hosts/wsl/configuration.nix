{ config, pkgs, lib, specialArgs, ... }:
let
  username = "sijanthapa"; # set to your user from Default/variables.nix
  hostname = "wsl";
in
{
  imports = [
    (import ../../nixos-wsl-repo/wsl.nix {
      inherit username hostname pkgs;
      inputs = specialArgs.inputs;
    })
  ];
}
