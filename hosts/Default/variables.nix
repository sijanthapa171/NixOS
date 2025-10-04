{
  # User Configuration
  username = "zer0"; # Your username (auto-set with install.sh, live-install.sh, rebuild)
  windowManager = "hyprland"; # Options: hyprland, i3
  terminal = "kitty"; # Options: kitty, alacritty, wezterm
  editor = "nixvim"; # Options: nixvim, vscode, helix, nvchad, neovim, emacs (WIP)
  browser = "zen"; # Options: firefox, floorp, zen
  terminalFileManager = "yazi"; # Options: yazi, lf
  sddmTheme = "astronaut"; # Options: astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  wallpaper = "kurzgesagt"; # See modules/themes/wallpapers for options
  shell = "zsh"; # Options: zsh, bash
  gaming = true; # Whether to enable the gaming module

  # Hardware Configuration
  videoDriver = "nvidia"; # CRITICAL: Choose your GPU driver (nvidia, amdgpu, intel)
  hostname = "NixOS"; # Your system hostname

  # Localization
  clock24h = true; # 24H or 12H clock in waybar
  locale = "en_US.UTF-8"; # System locale
  timezone = "Asia/Kathmandu"; # Your timezone
  kbdLayout = "us"; # Keyboard layout
  kbdVariant = ""; # Keyboard variant (can be empty)
  consoleKeymap = "us"; # TTY keymap
}
