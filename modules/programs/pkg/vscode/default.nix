{config, lib, pkgs, ...}:

with lib;
let
  cfg = config.modules.programs.pkg.vscode;
in
{
  options.modules.programs.pkg.vscode = {
    enable = mkEnableOption "vscode";
    enableCursor = mkEnableOption "code-cursor";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vscode
    ] ++ (if cfg.enableCursor then [ code-cursor ] else []);
  };
} 