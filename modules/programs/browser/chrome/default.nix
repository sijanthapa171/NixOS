{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.google-chrome = {
    enable = true;
    package = pkgs.google-chrome;
    # Common extensions and settings can be added here
    extensions = [
      # Add your preferred extensions here
    ];
  };
} 