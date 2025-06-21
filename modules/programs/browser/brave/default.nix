{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.brave = {
    enable = true;
    package = pkgs.brave;
    # Common extensions and settings can be added here
    extensions = [
      # Add your preferred extensions here
    ];
  };
} 