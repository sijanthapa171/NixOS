{ ... }:
{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "gruvbox_dark";
      theme_background = true;
      update_ms = 500;
      rounded_corners = false;
    };
  };

  #  home.packages = (with pkgs; [ nvtopPackages.intel ]);
}
