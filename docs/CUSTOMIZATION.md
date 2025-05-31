# Customization Guide

A detailed guide on how to customize your NixOS configuration to match your preferences and needs.

## 📝 Table of Contents

- [Theme Customization](#theme-customization)
- [Desktop Environment](#desktop-environment)
- [Program Configurations](#program-configurations)
- [System Tweaks](#system-tweaks)
- [Custom Packages](#custom-packages)

## 🎨 Theme Customization

### SDDM Themes

Available themes:
- astronaut
- black_hole
- purple_leaves
- jake_the_dog
- hyprland_kath

```nix
{
  settings = {
    sddmTheme = "purple_leaves";
  };
}
```

### Wallpapers

The system comes with a collection of wallpapers in `modules/themes/wallpapers/`:

```nix
{
  settings = {
    wallpaper = "kurzgesagt"; # See available options in modules/themes/wallpapers
  };
}
```

### GTK Theme

```nix
{
  home-manager.users.${settings.username} = {
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };
  };
}
```

## 🖥️ Desktop Environment

### Hyprland Configuration

```nix
{
  modules.desktop.hyprland = {
    enable = true;
    settings = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
      "col.active_border" = "rgba(33ccffee)";
    };
  };
}
```

### Window Manager Keybindings

```nix
{
  wayland.windowManager.hyprland = {
    keybindings = {
      "SUPER + Return" = "kitty";
      "SUPER + Space" = "rofi -show drun";
      "SUPER + Q" = "killactive";
    };
  };
}
```

## 🔧 Program Configurations

### Terminal Emulator (Kitty)

```nix
{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 12;
      background_opacity = "0.95";
      window_padding_width = 4;
    };
  };
}
```

### Browser (Floorp/Firefox)

```nix
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "browser.startup.homepage" = "https://nixos.org";
        "browser.search.region" = "US";
      };
    };
  };
}
```

### Development Environment

#### NixVim Configuration

```nix
{
  programs.nixvim = {
    enable = true;
    colorscheme = "catppuccin";
    plugins = {
      telescope.enable = true;
      treesitter.enable = true;
      lsp = {
        enable = true;
        servers = {
          rust-analyzer.enable = true;
          nil.enable = true;
        };
      };
    };
  };
}
```

## ⚙️ System Tweaks

### Performance Optimization

```nix
{
  boot = {
    kernelParams = [ "quiet" "splash" "nvidia-drm.modeset=1" ];
    loader = {
      timeout = 0;
      systemd-boot.consoleMode = "max";
    };
  };
  
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    deviceSection = ''
      Option "TripleBuffer" "on"
    '';
  };
}
```

### Power Management

```nix
{
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MAX_PERF_ON_BAT = 70;
    };
  };
}
```

## 📦 Custom Packages

### Creating a Custom Package

```nix
# pkgs/my-program/default.nix
{ stdenv
, lib
, fetchFromGitHub
, ...
}:

stdenv.mkDerivation rec {
  pname = "my-program";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "username";
    repo = "repo-name";
    rev = "v${version}";
    sha256 = "sha256-hash";
  };

  buildInputs = [
    # Dependencies
  ];

  meta = with lib; {
    description = "My custom program";
    homepage = "https://github.com/username/repo-name";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
```

### Adding Custom Repository

```nix
{
  nixpkgs.config.packageOverrides = pkgs: {
    my-repo = import (builtins.fetchTarball {
      url = "https://github.com/username/repo-name/archive/master.tar.gz";
    }) {};
  };
}
```

## 🔍 Testing Changes

### Testing Configuration

```bash
# Test configuration without switching
nixos-rebuild test --flake .#Default

# Build and activate configuration
nixos-rebuild switch --flake .#Default

# Roll back if something goes wrong
nixos-rebuild switch --rollback
```

### Debugging

```bash
# Show trace for errors
nixos-rebuild switch --flake .#Default --show-trace

# Print debug information
nixos-rebuild switch --flake .#Default -v
```

## 📚 Additional Resources

- [NixOS Wiki](https://nixos.wiki)
- [Home Manager Options](https://nix-community.github.io/home-manager/options.html)
- [Nixpkgs Manual](https://nixos.org/manual/nixpkgs/stable/) 