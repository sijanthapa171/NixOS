{...}: {
  home-manager.sharedModules = [
    (_: {
      programs.neovim.enable = true;
      home.file.".config/nvim" = {
        source = builtins.fetchGit {
          url = "https://github.com/authxt/Neve.git";
          rev = "be995c14eccfc0d52d3f621a6cf70993b11bd8b4";
        };
        recursive = true;
      };
    })
  ];
}
