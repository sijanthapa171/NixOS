{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    vscode
    brave
    localsend
    # xournalpp
    google-chrome
    jetbrains-toolbox
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
    jdk
  ];
}
