# NixOS Configuration System

<div align="center">
  <h2>🚀 A Modern, Customizable NixOS Configuration</h2>

  [![NixOS](https://img.shields.io/badge/NixOS-24.11-blue.svg?logo=nixos&logoColor=white)](https://nixos.org)
  [![License](https://img.shields.io/github/license/sijanthapa171/NixOS)](./LICENSE)
  [![Last Commit](https://img.shields.io/github/last-commit/sijanthapa171/NixOS/main)](https://github.com/sijanthapa171/NixOS/commits/main)
  [![Stars](https://img.shields.io/github/stars/sijanthapa171/NixOS?style=social)](https://github.com/sijanthapa171/NixOS/stargazers)
  [![Issues](https://img.shields.io/github/issues/sijanthapa171/NixOS)](https://github.com/sijanthapa171/NixOS/issues)
  [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/sijanthapa171/NixOS/pulls)
  [![Flakes](https://img.shields.io/badge/Nix-Flakes-blue.svg?logo=nixos&logoColor=white)](https://nixos.wiki/wiki/Flakes)

  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nixos-white.png" width="200" alt="NixOS Logo">

  <p>A powerful, modular, and reproducible NixOS configuration system designed for modern computing needs.</p>
</div>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#configuration">Configuration</a> •
  <a href="#customization">Customization</a> •
  <a href="#documentation">Documentation</a> •
  <a href="#contributing">Contributing</a>
</p>

## 📋 Overview

This NixOS configuration system leverages the power of Nix Flakes to create a fully reproducible and declarative system setup. Whether you're a developer, content creator, or power user, this configuration provides a solid foundation that can be easily customized to meet your specific needs.

### Why This Configuration?

- 🔄 **Reproducible**: Every aspect of your system can be recreated exactly as intended
- 🛠 **Modular**: Easily enable or disable components based on your needs
- 📦 **Declarative**: Your entire system configuration is defined in code
- 🔒 **Secure**: Security-focused defaults and easy-to-audit configurations
- 🎨 **Customizable**: Extensive theming and personalization options
- 🚀 **Performance**: Optimized system configurations for maximum efficiency

## ✨ Key Features

### Core Components

- 🔄 **Nix Flakes** - Next-generation reproducible package management
- 🏠 **Home Manager** - Sophisticated user environment management
- 🎨 **Desktop Environments** - Multiple pre-configured options:
  - Hyprland
  - GNOME
  - KDE Plasma
  - Custom WM setups
- 🛠️ **Development Tools**
  - Multiple editor configurations (NixVim, VSCode, NvChad)
  - Language-specific development environments
  - Docker and container support
  - Git configuration and tools

### System Features

- 📱 **Modern UI/UX**
  - Beautiful SDDM themes
  - Custom wallpaper collection
  - Consistent theming across applications
- 🔊 **Audio Setup**
  - PipeWire configuration
  - Audio control utilities
  - Bluetooth audio support
- 🎮 **Gaming Support**
  - Steam integration
  - Wine/Proton configuration
  - Gaming peripheral support
- 🔐 **Security Features**
  - Secure boot support
  - Firewall configuration
  - Security-focused browser settings

## 🚀 Installation

### Prerequisites

Before you begin, ensure you have:

- A NixOS installation or live environment
- Internet connection
- Basic understanding of Nix/NixOS concepts
- At least 50GB of free disk space
- 8GB RAM (16GB recommended)

### Quick Start

1. **Clone the Repository**
   ```bash
   git clone https://github.com/sijanthapa171/NixOS.git
   cd NixOS
   ```

2. **Review Configuration**
   ```bash
   # Edit flake.nix to set your preferences
   nano flake.nix
   ```

3. **Installation Options**

   For existing NixOS systems:
   ```bash
   ./install.sh
   ```

   For fresh installations:
   ```bash
   ./live-install.sh
   ```

4. **Post-Installation**
   ```bash
   # Rebuild and switch to the new configuration
   nixos-rebuild switch --flake .#Default
   ```

## ⚙️ Configuration

### Core Settings (`flake.nix`)

```nix
settings = {
  username = "your-username";
  editor = "nixvim";    # Options: nixvim, vscode, nvchad, neovim
  browser = "floorp";   # Options: firefox, floorp, zen
  terminal = "kitty";   # Options: kitty, alacritty, wezterm
  videoDriver = "nvidia"; # Options: nvidia, amdgpu, intel
};
```

### Available Configurations

| Category | Options | Description |
|----------|---------|-------------|
| Editors | nixvim, vscode, nvchad | Pre-configured editor setups |
| Browsers | firefox, floorp, zen | Browser configurations with privacy focus |
| Terminals | kitty, alacritty, wezterm | Modern terminal emulators |
| File Managers | yazi, lf | Terminal and GUI file managers |
| Themes | astronaut, black_hole, purple_leaves | SDDM and system themes |

## 📁 Project Structure

```
NixOS/
├── modules/           # Core system modules
│   ├── desktop/      # Desktop environments
│   ├── hardware/     # Hardware configurations
│   ├── programs/     # Application setups
│   ├── scripts/      # Utility scripts
│   └── themes/       # Visual customizations
├── hosts/            # Host-specific configs
├── pkgs/            # Custom packages
├── overlays/        # Nixpkgs overlays
└── dev-shells/      # Development environments
```

## 🔧 Customization

### Adding New Programs

1. Create a new module in `modules/programs/`:
   ```nix
   # modules/programs/your-program/default.nix
   { config, lib, pkgs, ... }:
   {
     config = {
       # Your configuration here
     };
   }
   ```

2. Import your module in the main configuration.

### Theme Customization

1. Choose a pre-configured theme:
   ```nix
   sddmTheme = "purple_leaves";
   ```

2. Or create your own in `modules/themes/`.

### Hardware Configuration

Adjust `hosts/Default/hardware-configuration.nix` for your specific hardware needs.

## 📚 Documentation

- [Configuration Guide](./docs/CONFIGURATION.md)
- [Customization Guide](./docs/CUSTOMIZATION.md)
- [Troubleshooting](./docs/TROUBLESHOOTING.md)
- [FAQ](./docs/FAQ.md)

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. 🍴 Fork the repository
2. 🌿 Create a feature branch
3. 💻 Make your changes
4. 🔍 Test your changes
5. 📝 Create a Pull Request

Please read our [Contributing Guidelines](./CONTRIBUTING.md) for more details.

## 🙏 Acknowledgments

- [NixOS Community](https://nixos.org)
- [Home Manager Project](https://github.com/nix-community/home-manager)
- All our amazing contributors

## ⚠️ Notes

- Regular updates are released - check the [changelog](./CHANGELOG.md)
- Report bugs through [GitHub Issues](https://github.com/sijanthapa171/NixOS/issues)
- Join our [Discord Community](https://discord.gg/nixos) for support

## 🔄 Update Policy

- Major updates: Every 6 months
- Security updates: As needed
- Bug fixes: Weekly/Bi-weekly

---

<div align="center">
  <p>Made with ❤️ by the NixOS community</p>
  <p>
    <a href="https://nixos.org">Website</a> •
    <a href="https://discourse.nixos.org">Forum</a> •
    <a href="https://matrix.to/#/#nixos:matrix.org">Matrix</a>
  </p>
</div> 
