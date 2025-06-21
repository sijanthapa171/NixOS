{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wine
    winetricks
    wineWowPackages.stable
  ];
} 