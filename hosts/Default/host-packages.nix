{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    vscode
    brave
    # localsend
    # xournalpp
    google-chrome
    # protonvpn-gui # VPN
    # github-desktop
    # pokego # Overlayed
  ];
}
