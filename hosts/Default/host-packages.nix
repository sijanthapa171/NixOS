{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    vscode
    brave
    # localsend
    # xournalpp
    google-chrome
    jetbrains-toolbox
    # protonvpn-gui # VPN
    # github-desktop
    # pokego # Overlayed
    (inputs.caelestia-shell.packages.${pkgs.system}.with-cli)
  ];
}
