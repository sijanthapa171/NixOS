# Frequently Asked Questions (FAQ)

Common questions and answers about this NixOS configuration.

## 📝 Table of Contents

- [General Questions](#general-questions)
- [Installation](#installation)
- [Configuration](#configuration)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Updates and Maintenance](#updates-and-maintenance)

## 🤔 General Questions

### What is this NixOS configuration?
This is a comprehensive, modular NixOS configuration system that uses Nix Flakes to provide a reproducible and customizable system setup. It includes pre-configured desktop environments, development tools, and system utilities.

### Why should I use this configuration?
- Fully reproducible system configuration
- Modular design for easy customization
- Pre-configured development environments
- Modern desktop environments and tools
- Security-focused defaults
- Easy maintenance and updates

### What's included in this configuration?
- Multiple desktop environment options (Hyprland, GNOME, KDE)
- Development tools and editors
- System utilities and applications
- Custom themes and wallpapers
- Security configurations
- Power management optimizations

## 💿 Installation

### What are the system requirements?
- CPU: Any x86_64 processor
- RAM: 8GB minimum (16GB recommended)
- Storage: 50GB minimum
- Graphics: Compatible with NVIDIA, AMD, or Intel
- Internet connection for installation

### How do I install this configuration?
1. Clone the repository
2. Edit `flake.nix` for your preferences
3. Run `./install.sh` or `./live-install.sh`
4. Reboot your system

### Can I test before installing?
Yes! Use `nixos-rebuild test --flake .#Default` to test the configuration without switching to it.

## ⚙️ Configuration

### How do I change basic settings?
Edit `flake.nix`:
```nix
{
  settings = {
    username = "your-username";
    hostname = "your-hostname";
    timezone = "Region/City";
    locale = "en_US.UTF-8";
  };
}
```

### How do I choose a different desktop environment?
Enable your preferred desktop environment in the configuration:
```nix
{
  modules.desktop = {
    hyprland.enable = true;  # Or gnome.enable, plasma.enable
  };
}
```

### How do I add custom packages?
Add them to your configuration:
```nix
{
  environment.systemPackages = with pkgs; [
    your-package
    another-package
  ];
}
```

## 🎨 Customization

### How do I change themes?
Set your preferred theme in settings:
```nix
{
  settings = {
    sddmTheme = "purple_leaves";
    wallpaper = "kurzgesagt";
  };
}
```

### Can I use my own wallpapers?
Yes! Add them to `modules/themes/wallpapers/` and reference them in your configuration.

### How do I customize keyboard shortcuts?
Edit the keybindings in your window manager configuration:
```nix
{
  wayland.windowManager.hyprland.keybindings = {
    "SUPER + Return" = "kitty";
    "SUPER + Space" = "rofi -show drun";
  };
}
```

## 🔧 Troubleshooting

### Common Issues

#### System won't boot after update
1. Boot from previous generation
2. Run `nixos-rebuild switch --rollback`

#### Graphics issues with NVIDIA
Ensure proper NVIDIA configuration:
```nix
{
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
  };
}
```

#### Audio not working
Check PipeWire configuration:
```nix
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}
```

## 🔄 Updates and Maintenance

### How do I update the system?
```bash
# Update flake inputs
nix flake update

# Rebuild system
nixos-rebuild switch --flake .#Default
```

### How do I clean up old generations?
```bash
# Remove old generations
sudo nix-collect-garbage -d

# Remove specific generations
sudo nix-env --delete-generations old
```

### How often should I update?
- Security updates: As soon as available
- Regular updates: Monthly recommended
- Major version upgrades: Every 6 months

## 🔐 Security

### Is this configuration secure?
Yes! It includes:
- Secure boot support
- Firewall configuration
- Security-focused browser settings
- Regular security updates

### How do I enable additional security features?
```nix
{
  security = {
    sudo.enable = true;
    rtkit.enable = true;
    polkit.enable = true;
  };
}
```

## 🤝 Community and Support

### Where can I get help?
- [NixOS Discourse](https://discourse.nixos.org)
- [NixOS Matrix Chat](https://matrix.to/#/#nixos:matrix.org)
- [GitHub Issues](https://github.com/authxt/NixOS/issues)

### How can I contribute?
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

### Where can I report bugs?
Open an issue on [GitHub](https://github.com/authxt/NixOS/issues) with:
- Description of the problem
- Steps to reproduce
- Expected vs actual behavior
- System information

## 📚 Learning Resources

### Where can I learn more about NixOS?
- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Nix Pills](https://nixos.org/guides/nix-pills/)
- [NixOS Wiki](https://nixos.wiki)
- [Home Manager Manual](https://nix-community.github.io/home-manager/) 