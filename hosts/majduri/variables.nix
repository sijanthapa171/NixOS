{
  username = "sijanthapa"; # auto-set with install.sh, live-install.sh, and rebuild scripts.

  # Desktop Environment
  desktop = "gnome"; # hyprland, i3, gnome, plasma6

  # Theme & Appearance
  bar = "noctalia-shell"; # waybar, hyprpanel, noctalia-shell, caelestia-shell
  waybarTheme = "minimal"; # stylish, minimal
  sddmTheme = "astronaut"; # astronaut, black_hole, purple_leaves, jake_the_dog, hyprland_kath
  defaultWallpaper = "galaxy.webp"; # Change with SUPER + SHIFT + W (Hyprland)
  hyprlockWallpaper = "galaxy.webp";

  # Default Applications
  terminal = "kitty"; # kitty, alacritty
  editor = "nixvim"; # nixvim, vscode
  browser = "firefox"; # zen-beta, firefox, floorp
  fileManager = "thunar"; # yazi, lf, thunar
  shell = "zsh"; # zsh, bash

  # Hardware
  hostname = "majduri";
  videoDriver = "intel"; # nvidia, amdgpu, intel
  nvidiaChannel = "stable"; # stable, latest, beta, legacy_xxx
  bluetoothSupport = true; # Whether your motherboard supports bluetooth

  # Localization
  timezone = "Asia/Kathmandu";
  locale = "en_US.UTF-8";
  clock24h = false;
  kbdLayout = "us";
  kbdVariant = "";
  consoleKeymap = "us";
  capslockRemap = false; # Wether to remap caps lock as ESC, do not forget to run `udevadm control --reload` and `udevadm trigger`

}
