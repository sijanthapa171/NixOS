{
  home-manager.sharedModules = [
    (_: {
      programs.bat = {
        enable = true;
      };
      home = {
        file = {
          ".config/bat/theme/Catppuccin Mocha.tmTheme".source = ./mocha.xml;
          ".config/bat/config".text = ''
            --theme="Catppuccin Mocha"
          '';
        };
        shellAliases = {
          cat = "bat";
        };
      };
    })
  ];
}
