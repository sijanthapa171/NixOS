{
  home-manager.sharedModules = [
    (_: {
      programs.kitty = {
        enable = true;
        font = {
          name = "JetBrainsMono Nerd Font";
          size = 11.0;
        };
        themeFile = "Catppuccin-Mocha";
        settings = {
          confirm_os_window_close = 0;
          scrollback_lines = 10000;
          enable_audio_bell = false;
          mouse_hide_wait = 60;
          window_padding_width = 4;

          ## Tabs
          tab_title_template = "{index}";
          active_tab_font_style = "normal";
          inactive_tab_font_style = "normal";
          tab_bar_style = "powerline";
          tab_powerline_style = "round";
          active_tab_foreground = "#1e1e2e";
          active_tab_background = "#cba6f7";
          inactive_tab_foreground = "#bac2de";
          inactive_tab_background = "#313244";
        };
        shellIntegration.mode = "no-sudo";
        keybindings = {
          ## Unbind
          "ctrl+shift+left" = "no_op";
          "ctrl+shift+right" = "no_op";
        };
      };
    })
  ];
}
