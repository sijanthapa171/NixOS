# Keyboard Shortcuts Guide

A comprehensive guide to keyboard shortcuts and keybindings in your NixOS configuration.

## 📝 Table of Contents

- [Global System Controls](#global-system-controls)
- [Window Management](#window-management)
- [Workspace Controls](#workspace-controls)
- [Applications](#applications)
- [Media Controls](#media-controls)
- [Special Functions](#special-functions)

## 🌐 Global System Controls

### System Actions
| Shortcut | Action | Description |
|----------|--------|-------------|
| `SUPER + Delete` | Exit | Kill Hyprland session |
| `SUPER + ALT + L` | Lock | Lock screen with hyprlock |
| `SUPER + Backspace` | Logout Menu | Open wlogout menu |
| `CTRL + ESC` | Toggle Bar | Toggle waybar |
| `SUPER + U` | Rebuild | Rebuild NixOS configuration |

### Display and Theme Controls
| Shortcut | Action |
|----------|--------|
| `SUPER + F9` | Enable Night Mode (3500K) |
| `SUPER + F10` | Disable Night Mode |
| `SUPER + CTRL + K` | Show Keybinds Help |

## 🖥️ Window Management

### Basic Window Controls
| Shortcut | Action |
|----------|--------|
| `SUPER + Q` or `ALT + F4` | Close Window |
| `SUPER + W` | Toggle Floating |
| `ALT + Return` | Toggle Fullscreen |
| `SUPER + SHIFT + G` | Toggle Group |
| `SUPER + Tab` | Cycle Windows |

### Window Movement
| Shortcut | Action |
|----------|--------|
| `SUPER + Arrow Keys` | Move Focus |
| `SUPER + H/J/K/L` | Move Focus (Vim-style) |
| `SUPER + SHIFT + CTRL + Arrow Keys` | Move Window |
| `SUPER + SHIFT + CTRL + H/J/K/L` | Move Window (Vim-style) |

### Window Resizing
| Shortcut | Action |
|----------|--------|
| `SUPER + SHIFT + Right` | Resize Active +30 0 |
| `SUPER + SHIFT + Left` | Resize Active -30 0 |
| `SUPER + SHIFT + Up` | Resize Active 0 -30 |
| `SUPER + SHIFT + Down` | Resize Active 0 +30 |
| `SUPER + Mouse Right` | Resize with Mouse |
| `SUPER + Mouse Left` | Move with Mouse |

## 🔲 Workspace Controls

### Workspace Navigation
| Shortcut | Action |
|----------|--------|
| `SUPER + [1-9]` | Switch to Workspace |
| `SUPER + CTRL + ←/→` | Switch Workspace Relative |
| `SUPER + CTRL + ↓` | Move to Empty Workspace |
| `SUPER + Mouse Wheel` | Scroll Through Workspaces |

### Window to Workspace
| Shortcut | Action |
|----------|--------|
| `SUPER + SHIFT + [1-9]` | Move to Workspace |
| `SUPER + CTRL + [1-9]` | Move to Workspace (Silent) |
| `SUPER + CTRL + ALT + ←/→` | Move to Relative Workspace |

### Special Workspace (Scratchpad)
| Shortcut | Action |
|----------|--------|
| `SUPER + S` | Toggle Special Workspace |
| `SUPER + CTRL + S` | Move to Special Workspace |
| `SUPER + ALT + S` | Move to Special Workspace (Silent) |

## 📱 Applications

### Quick Launch
| Shortcut | Action |
|----------|--------|
| `SUPER + Return` or `SUPER + T` | Terminal |
| `SUPER + E` | File Manager |
| `SUPER + C` | Code Editor |
| `SUPER + F` | Web Browser |
| `SUPER + SHIFT + S` | Spotify |
| `SUPER + SHIFT + Y` | YouTube Music |
| `CTRL + ALT + Delete` | System Monitor (btop) |

### Rofi Menus
| Shortcut | Action |
|----------|--------|
| `SUPER + A` or `SUPER + Space` | Applications Menu |
| `SUPER + Z` | Emoji Picker |
| `SUPER + G` | Game Launcher |
| `SUPER + V` | Clipboard Manager |
| `SUPER + M` | Music Control |

### Screenshots
| Shortcut | Action |
|----------|--------|
| `SUPER + P` | Screenshot Area/Window |
| `SUPER + CTRL + P` | Screenshot Area (Frozen) |
| `SUPER + Print` | Screenshot Monitor |
| `SUPER + ALT + P` | Screenshot All Outputs |


## 🎮 Special Functions

### Gaming
| Shortcut | Action |
|----------|--------|
| `SUPER + F8` | Toggle Auto-clicker (40 CPS) |
| `SUPER + ALT + G` | Toggle Game Mode |

### System
| Shortcut | Action |
|----------|--------|
| `SUPER + ALT + K` | Switch Keyboard Layout |
| `SUPER + CTRL + C` | Color Picker |

## 🖱️ Mouse Bindings

### Special Mouse Actions
| Shortcut | Action |
|----------|--------|
| `SUPER + Mouse Button 4/5` | Switch to Workspace 5/6 |
| `SUPER + SHIFT + Mouse Button 4/5` | Move Window to Workspace 5/6 |
| `SUPER + Mouse Left` | Move Window |
| `SUPER + Mouse Right` | Resize Window |

## ⚙️ Configuration Location

The keybindings are defined in:
- Main configuration: `modules/desktop/hyprland/default.nix`
- Custom scripts: `modules/desktop/hyprland/scripts/`

To view all keybindings in the system:
```bash
SUPER + ? or SUPER + / or SUPER + CTRL + K
``` 