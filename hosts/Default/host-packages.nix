{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    vscode
    brave
    localsend
    # xournalpp
    google-chrome
    dbeaver-bin
    maven
    jetbrains-toolbox
    android-studio
    sqlitebrowser
    # protonvpn-gui # VPN
    # github-desktop
    # pokego # Overlayed
    peaclock
    antigravity
    nodejs
    pnpm
    bun
    # temp---->
    gcc
    gdb
    gnumake
    pkg-config
    uv
    python3
    python3Packages.pip
    jdk
    deno
  ];
}
