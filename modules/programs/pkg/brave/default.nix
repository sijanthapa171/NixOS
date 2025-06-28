{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.brave;
in
{
  options.modules.programs.pkg.brave = {
    enable = mkEnableOption "brave";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      brave
    ];
  };
} 