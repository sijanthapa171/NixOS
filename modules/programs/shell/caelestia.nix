# Caelestia Shell Configuration Module
#
# This module integrates the Caelestia Shell into your NixOS system.
# The shell can be run via `caelestia-shell` command after installation.

{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.programs.caelestia;
in
{
  options.programs.caelestia = {
    enable = mkEnableOption "Caelestia Shell environment";
    
    enableCli = mkOption {
      type = types.bool;
      default = true;
      description = "Enable CLI functionality (recommended for full features)";
    };
    
    installGlobally = mkOption {
      type = types.bool;
      default = true;
      description = "Install Caelestia Shell to systemPackages (vs home.packages)";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = mkIf cfg.installGlobally [
      (if cfg.enableCli 
       then inputs.caelestia-shell.packages.${pkgs.system}.with-cli
       else inputs.caelestia-shell.packages.${pkgs.system}.default)
    ];
  };
}
