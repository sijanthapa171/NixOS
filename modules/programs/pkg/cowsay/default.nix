{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.cowsay;
in
{
  options.modules.programs.pkg.cowsay = {
    enable = mkEnableOption "cowsay";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cowsay
    ];
  };
} 