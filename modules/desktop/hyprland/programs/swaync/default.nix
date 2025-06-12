{
  home-manager.sharedModules = [
    (_: {
      home = {
        file = {
          ".config/swaync/config.json".source = ./config.json;
          ".config/swaync/style.css".source = ./styles.scss;
        };
      };
    })
  ];
}
