{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    gnupg

    # project
    jdk21
    maven

    glib
    gtk3
    xorg.libXxf86vm
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    mesa
  ];
}
