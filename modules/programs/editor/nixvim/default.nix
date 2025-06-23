{
  inputs,
  pkgs,
  system,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    
    # Import the configuration from the cloned repository
    imports = [
      ../nixvim-repo/config
    ];

    # You can add your own customizations here
    colorschemes.tokyonight = {
      enable = true;
      style = "storm";
      transparent = true;
    };

    globals.mapleader = " "; # Set leader key to space

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      undofile = true;
      termguicolors = true;
      scrolloff = 8;
    };
  };

  # Also include the package in home.packages
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        inputs.nixvim.packages.${system}.default
        # Additional dependencies for better experience
        ripgrep
        fd
        tree-sitter
        nodejs # Required for some LSP features
        git # Required for some plugins
      ];
    })
  ];
}
