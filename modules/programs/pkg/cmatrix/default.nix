{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.cmatrix;
in
{
  options.modules.programs.pkg.cmatrix = {
    enable = mkEnableOption "cmatrix";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cmatrix
    ];
  };
} 