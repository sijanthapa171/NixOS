{
  username = "sijanthapa"; # auto-set with install.sh, live-install.sh, and rebuild scripts.

  # Desktop Environment
  desktop = "hyprland"; # hyprland, i3, gnome, plasma6

  # Theme & Appearance
  bar = "waybar"; # waybar, wayle, hyprpanel, noctalia-shell, caelestia-shell
  waybarTheme = "minimal"; # stylish, minimal
  sddmTheme = "astronaut"; # astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  defaultWallpaper = "galaxy.webp"; # Change with SUPER + SHIFT + W (Hyprland)
  hyprlockWallpaper = "galaxy.webp";

  # Default Applications
  terminal = "kitty"; # kitty, alacritty, wezterm
  editor = "nixvim"; # nixvim, vscode
  browser = "firefox"; # zen-beta, firefox, floorp
  fileManager = "thunar"; # yazi, lf, thunar
  shell = "zsh"; # zsh, bash
  games = false; # Enable/Disable gaming module

  # Hardware
  hostname = "NixOS";
  videoDriver = "nvidia"; # nvidia, amdgpu, intel
  nvidiaChannel = "latest"; # stable, latest, beta, legacy_xxx
  bluetoothSupport = true; # Whether your motherboard supports bluetooth
  batterySupport = false; # Whether device has a battery (laptop)

  # Localization
  timezone = "Asia/Kathmandu";
  locale = "en_US.UTF-8";
  clock24h = false;
  kbdLayout = "us";
  kbdVariant = "";
  consoleKeymap = "us";
  capslockAsESC = false;
}