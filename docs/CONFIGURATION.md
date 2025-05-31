# Configuration Guide

This guide provides detailed information about configuring your NixOS system using this configuration.

## 📝 Table of Contents

- [Basic Configuration](#basic-configuration)
- [System Configuration](#system-configuration)
- [User Configuration](#user-configuration)
- [Hardware Configuration](#hardware-configuration)
- [Desktop Environments](#desktop-environments)
- [Advanced Configuration](#advanced-configuration)

## 🔧 Basic Configuration

### Core Settings

The main configuration is controlled through `flake.nix`. Here are the key settings:

```nix
{
  settings = {
    username = "your-username";
    hostname = "your-hostname";
    timezone = "Region/City";
    locale = "en_US.UTF-8";
    
    # System preferences
    editor = "nixvim";
    browser = "floorp";
    terminal = "kitty";
    terminalFileManager = "yazi";
  };
}
```

### Hardware Settings

```nix
{
  settings = {
    videoDriver = "nvidia"; # nvidia, amdgpu, intel
    kbdLayout = "us";
    kbdVariant = "";
  };
}
```

## 💻 System Configuration

### Boot Configuration

```nix
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [ "quiet" "splash" ];
  };
}
```

### Network Configuration

```nix
{
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
    };
  };
}
```

## 👤 User Configuration

### User Account Setup

```nix
{
  users.users.${settings.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.zsh;
  };
}
```

### Home Manager Configuration

```nix
{
  home-manager.users.${settings.username} = {
    home.stateVersion = "24.11";
    programs = {
      git = {
        enable = true;
        userName = "Your Name";
        userEmail = "your.email@example.com";
      };
    };
  };
}
```

## 🖥️ Desktop Environments

### Available Desktop Environments

1. **Hyprland**
   ```nix
   {
     modules.desktop.hyprland.enable = true;
   }
   ```

2. **GNOME**
   ```nix
   {
     modules.desktop.gnome.enable = true;
   }
   ```

3. **KDE Plasma**
   ```nix
   {
     modules.desktop.plasma.enable = true;
   }
   ```

### Theme Configuration

```nix
{
  settings = {
    sddmTheme = "purple_leaves";
    wallpaper = "kurzgesagt";
  };
}
```

## 🛠️ Advanced Configuration

### Custom Packages

Add custom packages in `pkgs/`:

```nix
# pkgs/custom-package/default.nix
{ stdenv, lib, ... }:

stdenv.mkDerivation {
  pname = "custom-package";
  version = "1.0.0";
  
  # Package definition
}
```

### Overlays

Add overlays in `overlays/`:

```nix
# overlays/custom-overlay.nix
final: prev: {
  custom-package = final.callPackage ../pkgs/custom-package {};
}
```

### Development Shells

Configure development environments in `dev-shells/`:

```nix
# dev-shells/python.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
  ];
}
```

## 🔍 Troubleshooting

### Common Issues

1. **Video Driver Issues**
   ```nix
   {
     settings.videoDriver = "nvidia";
     hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
   }
   ```

2. **Audio Issues**
   ```nix
   {
     sound.enable = true;
     hardware.pulseaudio.enable = false;
     security.rtkit.enable = true;
     services.pipewire = {
       enable = true;
       alsa.enable = true;
       pulse.enable = true;
     };
   }
   ```

## 📚 Additional Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nixpkgs Manual](https://nixos.org/manual/nixpkgs/stable/)

## 🔄 Updates and Maintenance

### System Updates

```bash
# Update system
nixos-rebuild switch --flake .#Default

# Update flake inputs
nix flake update
```

### Maintenance

```bash
# Clean old generations
sudo nix-collect-garbage -d

# Optimize store
sudo nix-store --optimize
``` 