{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.google-chrome;
in
{
  options.modules.programs.pkg.google-chrome = {
    enable = mkEnableOption "google-chrome";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      google-chrome
    ];
  };
} 