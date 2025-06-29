{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.figma;
in
{
  options.modules.programs.pkg.figma = {
    enable = mkEnableOption "figma";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      figma-linux
    ];
  };
} 