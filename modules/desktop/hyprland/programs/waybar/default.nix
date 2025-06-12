{
  home-manager.sharedModules = [
    (_: {
      programs.waybar = {
        enable = true;
        systemd = {
          enable = false;
          target = "graphical-session.target";
        };
        style = builtins.readFile ./style.css;
      };
      home = {
        file = {
          ".config/waybar/config".source = builtins.path {
            path = ./config.json;
            name = "waybar-config";
          };
          ".config/waybar/window-name.sh".source = builtins.path {
            path = ./window-name.sh;
            name = "waybar-windows-name";
          };
        };
      };
    })
  ];
}
