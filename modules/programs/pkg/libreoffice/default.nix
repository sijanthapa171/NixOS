{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.libreoffice;
in
{
  options.modules.programs.pkg.libreoffice = {
    enable = mkEnableOption "libreoffice";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
  };
} 