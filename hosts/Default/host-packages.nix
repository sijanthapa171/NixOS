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
    nitch
    peaclock
    antigravity
    nodejs
    code-cursor 
    pnpm
    bun


    # temp
                  gcc
              gdb
              gnumake
              pkg-config
  ];
}
