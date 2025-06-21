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


## 📋 Overview

This NixOS configuration system leverages the power of Nix Flakes to create a fully reproducible and declarative system setup. Whether you're a developer, content creator, or power user, this configuration provides a solid foundation that can be easily customized to meet your specific needs.


## ✨ Key Features

### Core Components

- 🔄 **Nix Flakes** - Next-generation reproducible package management
- 🏠 **Home Manager** - Sophisticated user environment management
- 🎨 **Desktop Environments** - Multiple pre-configured options:
  - Hyprland
  - GNOME
  - i3
  - Custom WM setups

## 🚀 Installation


### Quick Start

1. **Clone the Repository**
   ```bash
   git clone https://github.com/sijanthapa171/NixOS.git
   cd NixOS
   ```

2. **Review Configuration**
   ```bash
   # Edit flake.nix to set your preferences
   nvim flake.nix
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
   sysup
   ```
   
---

<div align="center">
  <p>Made with ❤️ by the NixOS community</p>
  <p>
    <a href="https://nixos.org">Website</a> •
    <a href="https://discourse.nixos.org">Forum</a> •
    <a href="https://matrix.to/#/#nixos:matrix.org">Matrix</a>
  </p>
</div> 
