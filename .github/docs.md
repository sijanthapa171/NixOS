# 📖 NixOS Dotfiles — Documentation

Complete guide for installing, configuring, and managing this NixOS configuration.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [From a Running NixOS System](#from-a-running-nixos-system)
  - [From the Live ISO](#from-the-live-iso)
- [Configuration](#configuration)
  - [variables.nix — The Control Center](#variablesnix--the-control-center)
  - [host-packages.nix](#host-packagesnix)
  - [configuration.nix](#configurationnix)
- [Host Management](#host-management)
  - [Creating a New Host (Automatic)](#creating-a-new-host-automatic)
  - [Creating a New Host (Manual)](#creating-a-new-host-manual)
- [Rebuilding](#rebuilding)
- [Rollbacks](#rollbacks)
- [Development Shells](#development-shells)
- [Module Reference](#module-reference)
  - [Core Modules](#core-modules)
  - [Desktop Environments](#desktop-environments)
  - [Programs](#programs)
  - [Themes & Wallpapers](#themes--wallpapers)
  - [Hardware](#hardware)
  - [Scripts](#scripts)
- [Flake Inputs](#flake-inputs)
- [FAQ](#faq)

---

## Prerequisites

- A machine running **NixOS** (or the NixOS minimal live ISO).
- **Git** installed (`nix-shell -p git` if needed on the live ISO).
- Internet connection for fetching flake inputs.

---

## Installation

### From a Running NixOS System

```bash
# 1. Clone the repository
git clone https://github.com/sijanthapa171/NixOS.git ~/NixOS

# 2. Enter the directory
cd ~/NixOS

# 3. Run the installer
./install.sh
```

The installer will walk you through:

1. **Host selection** — Pick an existing host or create a new one.
2. **GPU driver selection** — Choose between NVIDIA, AMD, or Intel.
3. **Username detection** — Automatically sets your current username.
4. **Edit `variables.nix`** — Opens your config for final tweaks.
5. **Hardware config generation** — Auto-generates `hardware-configuration.nix`.
6. **Build & apply** — Runs `nixos-rebuild boot` with your chosen host.

> [!TIP]
> After a successful build, **reboot** to apply the new configuration.

### From the Live ISO

1. Download the [NixOS Minimal ISO](https://nixos.org/download/#nixos-iso) and boot into it.
2. Connect to the internet.
3. Run:

```bash
nix-shell -p git
git clone https://github.com/sijanthapa171/NixOS.git ~/NixOS
cd ~/NixOS
./install.sh
```

The script detects the live environment and automatically launches `live-install.sh`, which handles disk partitioning, formatting, and a full system installation.

> [!CAUTION]
> The live installer will **format disks**. Make sure you have backups before proceeding.

---

## Configuration

All per-host customization is centralized in three files under `hosts/<YOUR_HOST>/`.

### `variables.nix` — The Control Center

This is the **single source of truth** for your system preferences. Every option here maps to a module that gets conditionally loaded.

```nix
{
  username = "yourname";          # Set automatically by install.sh

  # Desktop Environment
  desktop = "hyprland";           # hyprland | gnome | plasma6 | i3

  # Theme & Appearance
  bar = "waybar";               # waybar | hyprpanel | noctalia
  waybarTheme = "minimal";        # stylish | minimal
  sddmTheme = "astronaut";        # astronaut | black_hole | purple_leaves
                                  # jake_the_dog | hyprland_kath
  defaultWallpaper = "galaxy.webp";
  hyprlockWallpaper = "galaxy.webp";

  # Default Applications
  terminal = "kitty";             # kitty | alacritty
  editor = "nixvim";              # nixvim | vscode  | doom-emacs
                                  # nvchad | neovim
  browser = "firefox";            # firefox | zen-beta | floorp
  tuiFileManager = "yazi";        # yazi | lf
  shell = "zsh";                  # zsh | bash
  games = true;                   # true | false — toggles gaming module

  # Hardware
  hostname = "NixOS";
  videoDriver = "nvidia";          # nvidia | amdgpu | intel
  bluetoothSupport = true;

  # Localization
  timezone = "Asia/Kathmandu";
  locale = "en_US.UTF-8";
  clock24h = true;
  kbdLayout = "us";
  kbdVariant = "";
  consoleKeymap = "us";
}
```

> [!IMPORTANT]
> After editing `variables.nix`, you must **rebuild** for changes to take effect.

### `host-packages.nix`

Add host-specific packages here. These are packages that only this particular machine needs (e.g., a laptop might need `brightnessctl`).

### `configuration.nix`

The entry point for each host. It imports the shared modules and can contain host-specific overrides or extra module imports.

---

## Host Management

Hosts let you maintain separate configurations for different machines (desktop, laptop, server, etc.) — all from the same repository.

### Creating a New Host (Automatic)

Run the installer again and select `n` to create a new host:

```bash
cd ~/NixOS && ./install.sh
```

You'll be prompted to:
1. Name the new host.
2. Select an existing host as a template.
3. The script copies the template, updates the hostname, adds it to `flake.nix`, and builds.

### Creating a New Host (Manual)

```bash
# 1. Copy an existing host as a template
cp -r hosts/Default hosts/Laptop

# 2. Edit the new host's variables
nano hosts/Laptop/variables.nix

# 3. Add to flake.nix under nixosConfigurations
```

```nix
nixosConfigurations = {
  Default = mkHost "Default";
  Laptop  = mkHost "Laptop";   # ← add this line
};
```

```bash
# 4. Build with the new hostname
sudo nixos-rebuild switch --flake ~/NixOS#Laptop
```

---

## Rebuilding

After making configuration changes, apply them with any of these methods:

| Method | Command |
| :--- | :--- |
| **Keyboard shortcut** | `Super + U` |
| **Rebuild script** | `rebuild` |
| **nixos-rebuild** | `sudo nixos-rebuild switch --flake ~/NixOS#<HOST>` |
| **nh** | `nh os switch --hostname <HOST>` |

Replace `<HOST>` with your host name (e.g., `Laptop`).

> [!NOTE]
> After the first successful build, the `rebuild` script and `Super + U` shortcut will automatically detect your hostname — no need to specify it.

---

## Rollbacks

NixOS keeps every previous system generation, so you can always go back.

```bash
# List all generations
list-gens

# Roll back to generation N
rollback N
```

Replace `N` with the generation number (e.g., `42`).

> [!TIP]
> You can also select a previous generation from the **boot menu** during startup.

---

## Development Shells

This configuration includes **43 ready-to-use dev shell templates** for various languages and frameworks:

<details>
<summary><b>📋 Available Templates (click to expand)</b></summary>

| Language / Framework | Template Name |
| :--- | :--- |
| Bevy (Rust) | `bevy` |
| Bun | `bun` |
| C / C++ | `c-cpp` |
| Clojure | `clojure` |
| CUE | `cue` |
| Deno | `deno` |
| Dhall | `dhall` |
| Elixir | `elixir` |
| Elm | `elm` |
| Gleam | `gleam` |
| Go | `go` |
| HashiCorp (Terraform) | `hashi` |
| Haskell | `haskell` |
| Haxe | `haxe` |
| Java | `java` |
| Jupyter | `jupyter` |
| Kotlin | `kotlin` |
| LaTeX | `latex` |
| Lean 4 | `lean4` |
| Nickel | `nickel` |
| Nim | `nim` |
| Nix | `nix` |
| Node.js | `node` |
| OCaml | `ocaml` |
| Odin | `odin` |
| OPA | `opa` |
| PHP | `php` |
| PlatformIO | `platformio` |
| Protobuf | `protobuf` |
| Pulumi | `pulumi` |
| PureScript | `purescript` |
| Python | `python` |
| R | `r` |
| Ruby | `ruby` |
| Rust | `rust` |
| Scala | `scala` |
| Shell | `shell` |
| SWI-Prolog | `swi-prolog` |
| Swift | `swift` |
| Typst | `typst` |
| V | `vlang` |
| Zig | `zig` |
| Empty (blank) | `empty` |

</details>

### Usage

```bash
# Initialize a template in the current directory
nix flake init -t ~/NixOS#<TEMPLATE_NAME>

# Or create a new project directory
nix flake new -t ~/NixOS#<TEMPLATE_NAME> <PROJECT_NAME>

# Enter the dev shell
cd <PROJECT_NAME>
nix develop
```

> [!TIP]
> If you're using **direnv** (included in this config), the dev shell activates automatically when you `cd` into the project — no need to run `nix develop` manually.

---

## Module Reference

### Core Modules

Located at `modules/core/`. These are the system foundations — modify only if you know what you're doing.

| Module | Purpose |
| :--- | :--- |
| `boot.nix` | Bootloader & kernel configuration |
| `network.nix` | NetworkManager, firewall, Bluetooth |
| `dns.nix` | DNS resolution & privacy settings |
| `packages.nix` | System-wide base packages |
| `fonts.nix` | Font packages & configuration |
| `services.nix` | System services (pipewire, dbus, etc.) |
| `security.nix` | Polkit, sudo, security policies |
| `sddm.nix` | Display manager & login screen |
| `users.nix` | User accounts & groups |
| `system.nix` | Nix settings, flake config, garbage collection |
| `bash.nix` / `zsh.nix` | Shell configuration & aliases |
| `starship.nix` | Starship prompt theming |
| `ssh.nix` | SSH client/server configuration |
| `nh.nix` | [nh](https://github.com/viperML/nh) — a nice Nix helper |
| `games.nix` | Steam, Lutris, MangoHud, Gamemode (togglable) |
| `virtualisation.nix` | Docker, Podman, VMs (opt-in) |
| `flatpak.nix` | Flatpak support (opt-in) |
| `printing.nix` | CUPS printing |
| `syncthing.nix` | Syncthing file sync |
| `dlna.nix` | DLNA media server (opt-in) |

### Desktop Environments

Located at `modules/desktop/`. Set via `desktop` in `variables.nix`.

| Desktop | Path |
| :--- | :--- |
| **Hyprland** | `modules/desktop/hyprland/` |
| **GNOME** | `modules/desktop/gnome/` |
| **KDE Plasma 6** | `modules/desktop/plasma6/` |
| **i3** | `modules/desktop/i3/` |

### Programs

Located at `modules/programs/`. Organized by category.

**Browsers** (`programs/browser/`) — Firefox, Zen, Floorp

**Editors** (`programs/editor/`) — Nixvim, VS Code, Neovim

**Terminals** (`programs/terminal/`) — Kitty, Alacritty

**CLI Tools** (`programs/cli/`) — Yazi, lf, Tmux, Direnv, Lazygit, Cava, Btop, Fastfetch

**Media** (`programs/media/`) — Discord, Spicetify, MPV, OBS Studio, Thunderbird, YouTube Music

**Misc** (`programs/misc/`) — TLP (power management), Thunar (file manager), LACT (GPU tuning), CpuFreq

### Themes & Wallpapers

Located at `modules/themes/`.

| Theme | Description |
| :--- | :--- |
| **Catppuccin** | Warm pastel palette |
| **Dracula** | Dark purple-toned theme |
| **Rosé Pine** | Soft, muted natural tones |

**15+ wallpapers** are bundled in `modules/themes/wallpapers/`. Change the active wallpaper with `Super + Shift + W` (Hyprland) or set `defaultWallpaper` in `variables.nix`.

### Hardware

| Module | Path | Purpose |
| :--- | :--- | :--- |
| **GPU Drivers** | `modules/hardware/video/` | NVIDIA, AMD, Intel drivers |
| **Drives** | `modules/hardware/drives/` | Additional drive mounts |

### Scripts

Custom helper scripts at `modules/scripts/`:

| Script | Purpose |
| :--- | :--- |
| `rebuild.nix` | Rebuild & apply configuration |
| `rollback.nix` | Roll back to a previous generation |
| `launcher.nix` | Application launcher utilities |
| `tmux-sessionizer.nix` | Tmux session manager |
| `network.nix` | Network connection helpers |
| `extract.nix` | Archive extraction utility |
| `driverinfo.nix` | Display GPU driver information |
| `underwatt.nix` | CPU undervolting utility |

---

## Flake Inputs

This configuration uses the following Nix flake inputs:

| Input | Purpose |
| :--- | :--- |
| **nixpkgs** (unstable) | Primary package source |
| **nixpkgs-stable** (25.11) | Stable fallback packages |
| **home-manager** | Per-user config management |
| **nix-index-database** | Fast `nix-locate` lookups |
| **nix-flatpak** | Declarative Flatpak support |
| **nixvim** | Nixified Neovim configuration |
| **nix-doom-emacs** | Doom Emacs via Nix |
| **nvchad4nix** | NvChad via Nix |
| **spicetify-nix** | Spotify theming |
| **zen-browser** | Zen browser flake |
| **plasma-manager** | Declarative KDE Plasma config |
| **noctalia** | Noctalia shell / status bar |
| **nur** | Nix User Repository |
| **betterfox** | Firefox `user.js` hardening |
| **thunderbird-catppuccin** | Catppuccin theme for Thunderbird |

---

## FAQ

### How do I add a new package system-wide?

Add it to `hosts/<HOST>/host-packages.nix` for a specific host, or to `modules/core/packages.nix` for all hosts. Then rebuild.

### How do I switch desktop environments?

Edit `desktop` in `hosts/<HOST>/variables.nix`:

```nix
desktop = "gnome";  # hyprland | gnome | plasma6 | i3
```

Then rebuild with `rebuild` or `Super + U`.

### How do I add a new GPU driver?

Edit `videoDriver` in `variables.nix`:

```nix
videoDriver = "nvidia";  # nvidia | amdgpu | intel
```

### How do I enable gaming?

Set `games = true;` in `variables.nix`. This enables Steam, Lutris, MangoHud, and Gamemode.

### How do I change the login screen theme?

Set `sddmTheme` in `variables.nix`:

```nix
sddmTheme = "black_hole";  # astronaut | black_hole | purple_leaves
                             # jake_the_dog | hyprland_kath
```

### Where do I find all keybindings?

Press `Super + ?` or `Super + Ctrl + K` while in your desktop session.

---

<p align="center">
  Made with ❄️ and Nix
</p>
