{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wine64
    winetricks
    wineWowPackages.stable
  ];
} 