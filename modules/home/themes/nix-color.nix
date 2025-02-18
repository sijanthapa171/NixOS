{ inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  #colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

}
