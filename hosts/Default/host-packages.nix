{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    vscode
    brave
    google-chrome
    # protonvpn-gui # VPN
    # github-desktop
    # pokego # Overlayed
  ];
}
