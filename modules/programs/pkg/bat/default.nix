{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.bat;
in
{
  options.modules.programs.pkg.bat = {
    enable = mkEnableOption "bat";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bat
    ];
  };
} 