{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.obsidian;
in
{
  options.modules.programs.pkg.obsidian = {
    enable = mkEnableOption "obsidian";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
} 