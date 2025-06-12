{ pkgs
, ...
}:
{
  home-manager.sharedModules = [
    (_: {
      programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        terminal = "${pkgs.alacritty}/bin/alacritty";
      };
      home = {
        file = {
          ".config/rofi/config-music.rasi".source = ./config-music.scss;
          ".config/rofi/config-long.rasi".source = ./config-long.scss;
          ".config/rofi/config-wallpaper.rasi".source = ./config-wallpaper.scss;
          ".config/rofi/launchers" = {
            source = ./launchers;
            recursive = true;
          };

          "config/rofi/colors" = {
            source = ./colors;
            recursive = true;
          };
          ".config/rofi/pywal-color" = {
            source = ./pywal-color;
            recursive = true;
          };

          ".config/rofi/assets" = {
            source = ./assets;
            recursive = true;
          };
          ".config/rofi/resolution" = {
            source = ./resolution;
            recursive = true;
          };
          ".config/rofi/wall-selector.rasi".source = ./config-wall-selector.scss;
        };
      };
    })
  ];
}
