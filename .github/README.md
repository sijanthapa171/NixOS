<p align="center">
  <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake-colours.svg" width="120" alt="NixOS Snowflake" />
</p>

<h1 align="center">❄️ NixOS Dotfiles</h1>

<p align="center">
  <b>A fully declarative, reproducible, and modular NixOS system configuration.</b>
</p>

<p align="center">
  <a href="#-features"><img src="https://img.shields.io/badge/Features-blue?style=for-the-badge" /></a>
  <a href="#-quick-start"><img src="https://img.shields.io/badge/Quick%20Start-green?style=for-the-badge" /></a>
  <a href="./docs.md"><img src="https://img.shields.io/badge/Docs-orange?style=for-the-badge" /></a>
  <a href="../LICENSE"><img src="https://img.shields.io/badge/License-MIT-purple?style=for-the-badge" /></a>
</p>

---

## ✨ Features

🖥️ **4 Desktop Environments** — Hyprland · GNOME · KDE Plasma 6 · i3

🎨 **3 Stunning Themes** — Catppuccin · Dracula · Rosé Pine

🧰 **43 Dev Shell Templates** — Instant, reproducible environments for nearly every language

🔧 **One-Variable Config** — Switch your desktop, editor, terminal, browser, GPU driver, and more from a single `variables.nix`

📦 **Multi-Host Support** — Manage unlimited machines from one flake

🚀 **One-Command Install** — Automated `install.sh` handles everything from a fresh ISO to a running system

🔁 **Instant Rollbacks** — Roll back any generation with a single command

🎮 **Gaming Ready** — Steam, Lutris, MangoHud, Gamemode — toggle with one boolean

---

## 🧩 What's Inside

| Category | Options |
| :--- | :--- |
| **Desktop** | Hyprland, GNOME, Plasma 6, i3 |
| **Status Bar** | Waybar (stylish / minimal), HyprPanel, Noctalia |
| **Terminal** | Kitty, Alacritty |
| **Editor** | Nixvim, VS Code, Helix, Doom Emacs, NvChad, Neovim |
| **Browser** | Firefox, Zen, Floorp |
| **File Manager** | Yazi, lf, Thunar |
| **Shell** | Zsh (w/ Starship), Bash |
| **Media** | Spicetify, Discord, MPV, OBS Studio, Thunderbird |
| **GPU Drivers** | NVIDIA, AMD, Intel |
| **Themes** | Catppuccin, Dracula, Rosé Pine |
| **SDDM Themes** | Astronaut, Black Hole, Purple Leaves, Jake the Dog, Hyprland Kath |
| **Wallpapers** | 15+ curated wallpapers (change with `Super + Shift + W`) |

---

## 🚀 Quick Start

> [!NOTE]
> Works on both a running NixOS system and the NixOS live installer (minimal ISO recommended).
> Download the ISO from the [official NixOS website](https://nixos.org/download/#nixos-iso).

```bash
# 1. Clone the repo
git clone https://github.com/sijanthapa171/NixOS.git ~/NixOS

# 2. Run the installer
cd ~/NixOS && ./install.sh
```

The installer will:
- Let you **select or create** a host profile
- Prompt for **GPU driver** selection (NVIDIA / AMD / Intel)
- Open `variables.nix` for you to **customize** your setup
- Auto-generate `hardware-configuration.nix` for your machine
- **Build and apply** the configuration

> [!TIP]
> After the first install, rebuild anytime with `Super + U`, the `rebuild` command, or see [docs.md](./docs.md) for all methods.

---


## ⌨️ Key Bindings

Press `Super + ?` or `Super + Ctrl + K` to view all keybindings.

| Shortcut | Action |
| :--- | :--- |
| `Super + U` | Rebuild system |
| `Super + Shift + W` | Change wallpaper |
| `Super + ?` | Show all keybindings |

---

## 📖 Documentation

See **[docs.md](./docs.md)** for the full setup guide, host management, dev shells, rollbacks, and configuration reference.

---

## 📜 License

This project is licensed under the [MIT License](../LICENSE).
