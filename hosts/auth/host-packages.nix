{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    vscode
    brave
    xournalpp
    google-chrome
    # protonvpn-gui # VPN
    # github-desktop
    # pokego # Overlayed
  ];
}
