{
  # User Configuration
  username = "sijanthapa"; # Your username (auto-set with install.sh, live-install.sh, rebuild)
  desktop = "hyprland"; # Options: hyprland, i3-gaps, gnome, plasma6
  terminal = "kitty"; # Options: kitty, alacritty
  editor = "nixvim"; # Options: nixvim, vscode, helix, doom-emacs, nvchad, neovim
  browser = "zen"; # Options: firefox, floorp, zen
  tuiFileManager = "yazi"; # Options: yazi, lf
  sddmTheme = "astronaut"; # Options: astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  defaultWallpaper = "kurzgesagt.webp"; # to change wallpaper: SUPER + SHIFT + W
  hyprlockWallpaper = "evening-sky.webp"; # See modules/themes/wallpapers for options
  shell = "zsh"; # Options: zsh, bash
  games = true; # Whether to enable the gaming module

  # Hardware Configuration
  videoDriver = "intel"; # CRITICAL: Choose your GPU driver (nvidia, amdgpu, intel)
  hostname = "NixOS"; # Your system hostname

  # Localization
  clock24h = true; # 24H or 12H clock in waybar
  locale = "en_US.UTF-8"; # System locale
  timezone = "Asia/Kathmandu"; # Your timezone
  kbdLayout = "us"; # Keyboard layout
  kbdVariant = ""; # Keyboard variant (can be empty)
  consoleKeymap = "us"; # TTY keymap
}
