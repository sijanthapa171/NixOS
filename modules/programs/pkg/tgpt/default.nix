{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.tgpt;
in
{
  options.modules.programs.pkg.tgpt = {
    enable = mkEnableOption "tgpt";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      tgpt
    ];
  };
} 