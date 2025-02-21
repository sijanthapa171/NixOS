# NixOS Configurations
Welcome to my NixOS configuration repository, where I blend the wisdom of the Sijan with the power of declarative Linux. This setup focuses on providing a lightweight, customizable, and visually pleasing desktop environment using [Hyprland](https://github.com/hyprwm/Hyprland).

---

## ✨ Features
- **Hyprland**: A modern Wayland compositor for dynamic and tiling window management.
- **Alacritty**: A GPU-accelerated terminal emulator, fast and simple.
- **Rofi**: A customizable application launcher and menu.
- **Modular NixOS**: Easy-to-use and reusable configurations for different setups.
- **Tmux**: terminal mutiplexer i use with Alacritty or tty  to enhanche productivity.
- **Nvim**: the holy editor. with lazyvim.
---

![pics](assets/kyomi.png)

Feel free to tweak it to better match your preferences or add more details!


# 🚀 Neovim Keybindings

## Updates and Features

- Added Lua line and different color schemes.
- Included autopairs and other tools from Primeagen's directory.
- Added Git integration with Gitsigns and Fugitive.

```lua
:lua ColorMyPencils("specified themes from colors.lua directory")
```

## 📚 Table of Contents

- [Custom Keybindings](#custom-keybindings)
  - [Completion](#completion)
  - [File Operations](#file-operations)
  - [Search and Navigation](#search-and-navigation)
  - [Buffer and Window Management](#buffer-and-window-management)
  - [Editing and Text Manipulation](#editing-and-text-manipulation)
  - [LSP and Diagnostics](#lsp-and-diagnostics)
  - [Other Actions](#other-actions)
- [Default Neovim Keybindings](#default-neovim-keybindings)
  - [File Operations](#file-operations-1)
  - [Window Management](#window-management)
  - [Cursor Movement](#cursor-movement)
  - [Text Manipulation](#text-manipulation)
  - [Editing](#editing)
  - [Search and Navigation](#search-and-navigation-1)
  - [Undo and Redo](#undo-and-redo)
  - [Miscellaneous](#miscellaneous)

## 🎨 Custom Keybindings

### Completion

| Mode   | Keybinding  | Action                      |
|--------|-------------|-----------------------------|
| Insert | `<C-p>`     | Select previous completion. |
| Insert | `<C-n>`     | Select next completion.     |
| Insert | `<C-y>`     | Confirm completion.         |
| Insert | `<C-Space>` | Jump to LSP configuration.  |

### File Operations

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `<leader>pv`   | Open the file explorer (`vim.cmd.Ex`).           |
| Normal | `<leader>f`    | Format file using LSP (`vim.lsp.buf.format`).    |
| Normal | `<leader>x`    | Make file executable (`<cmd>!chmod +x %<CR>`).   |
| Normal | `<leader>vpp`  | Edit Neovim configuration.                      |

### Search and Navigation

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `<leader>pws`  | Search current word in the file.                |
| Normal | `<leader>pWs`  | Search current word (with uppercase boundary).   |
| Normal | `<leader>ps`   | Search a string entered by the user.            |
| Normal | `n`            | Next search result, centered.                   |
| Normal | `N`            | Previous search result, centered.               |
| Normal | `<leader>vh`   | Open help tags.                                  |

### Buffer and Window Management

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `<C-w>h`       | Move to left window.                            |
| Normal | `<C-w>j`       | Move to bottom window.                          |
| Normal | `<C-w>k`       | Move to top window.                             |
| Normal | `<C-w>l`       | Move to right window.                           |
| Normal | `<C-w>q`       | Close current window.                           |
| Normal | `<C-w>w`       | Switch between windows.                         |

### Editing and Text Manipulation

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Visual | `J`            | Move selected lines down.                       |
| Visual | `K`            | Move selected lines up.                         |
| Normal | `J`            | Join lines and maintain cursor position.        |
| Normal | `<leader>p`    | Paste without affecting the register.           |
| Normal | `<leader>y`    | Yank to system clipboard.                       |
| Normal | `<leader>Y`    | Yank whole line to system clipboard.            |
| Normal | `<leader>d`    | Delete to black hole register.                  |
| Normal | `<leader>s`    | Substitute word.                                |

### LSP and Diagnostics

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `<leader>zig`  | Restart LSP.                                    |
| Normal | `<C-k>`        | Next quickfix item.                             |
| Normal | `<C-j>`        | Previous quickfix item.                         |
| Normal | `<leader>k`    | Next location list item.                        |
| Normal | `<leader>j`    | Previous location list item.                    |
| Normal | `<leader>tt`   | Toggle Trouble plugin.                          |

### Other Actions

| Mode   | Keybinding       | Action                                           |
|--------|------------------|--------------------------------------------------|
| Normal | `<leader>mr`     | Start Cellular Automaton rain animation.        |
| Normal | `<leader><leader>`| Source the configuration file.                  |
| Normal | `<leader>ss`     | Format the file and save.                       |

## 🔧 Default Neovim Keybindings

### File Operations

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `:w`           | Save file.                                      |
| Normal | `:q`           | Quit Neovim.                                    |
| Normal | `:wq`          | Save and quit.                                  |
| Normal | `:x`           | Save and quit (same as `:wq`).                  |
| Normal | `:e <file>`    | Edit a file.                                    |

### Window Management

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `:split`       | Split window horizontally.                      |
| Normal | `:vsplit`      | Split window vertically.                        |

### Cursor Movement

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `gg`           | Go to the top of the file.                      |
| Normal | `G`            | Go to the bottom of the file.                   |
| Normal | `0`            | Go to the beginning of the line.                |
| Normal | `$`            | Go to the end of the line.                      |

### Text Manipulation

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `dd`           | Delete current line.                            |
| Normal | `yy`           | Yank (copy) current line.                       |
| Normal | `p`            | Paste text after the cursor.                    |
| Normal | `P`            | Paste text before the cursor.                   |
| Visual | `y`            | Yank selected text.                             |
| Visual | `d`            | Delete selected text.                           |

### Editing

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Insert | `<C-h>`        | Delete character before the cursor.             |
| Insert | `<C-w>`        | Delete word before the cursor.                  |
| Insert | `<C-u>`        | Delete all text before the cursor.              |
| Insert | `<Esc>`        | Exit insert mode.                               |

### Search and Navigation

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `/`            | Search for text in the file.                    |
| Normal | `n`            | Next search result.                             |
| Normal | `N`            | Previous search result.                         |
| Normal | `*`            | Search for the word under the cursor.           |

### Undo and Redo

| Mode   | Keybinding     | Action                                           |
|--------|----------------|--------------------------------------------------|
| Normal | `u`            | Undo the last change.                           |
| Normal | `<C-r>`        | Redo the last undone change.                    |

### Miscellaneous

| Mode   | Keybinding       | Action                                           |
|--------|------------------|--------------------------------------------------|
| Normal | `:`              | Enter command mode.                             |
| Normal | `.`              | Repeat last command.                            |
| Normal | `<leader>ww`     | Open VimWiki in the current window.             |
| Normal | `<leader>wt`     | Open VimWiki in a new tab.                      |
| Normal | `<C-b>`          | Open NvimTree.                                  |
