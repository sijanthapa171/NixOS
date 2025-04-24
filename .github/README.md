<h1 align="center">
   <img src="assets/nixos-logo.png" width="100px" /> 
   <br> :snowflake:
      My NixOS system
   :snowflake:
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

</h1>


# Installation
> [!Note]
> <p>You should review the configuration variables in `flake.nix` before installing.<br>
> Also, check the imports at the top of `hosts/Default/configuration.nix`</p>
You can use the `install.sh` script while booted into a system or in the live installer.<br>
If you prefer the latter, you can obtain an ISO from [here](https://nixos.org/download/#nixos-iso).<br>
The minimal ISO is recommended, but you can use any.
```bash
git clone https://github.com/authxt/NixOS.git ~/NixOS
```
```bash
cd ~/NixOS
```
```bash
./install.sh
```

# Hyprland Keybindings

This document lists custom keybindings configured for a Hyprland setup. These bindings cover system control, window management, launching applications, multimedia control, and more.

> [!TIP]
> <b>Windows!</b>
> <p>SUPER key = WindowsKey </p>
> > <b>For a list of keybinds press Super + ? or Super + Ctrl + K </b>


## Application Launchers

| Keybinding         | Action                         |
| ------------------ | ------------------------------ |
| SUPER + Return / T | Launch terminal                |
| SUPER + E          | Launch file manager            |
| SUPER + F          | Launch browser                 |
| SUPER + A / SPACE  | Launch application menu (Rofi) |
| SUPER + G          | Game launcher (Rofi)           |
| SUPER + M          | Online music launcher (Rofi)   |
| SUPER + Z          | Emoji picker (Rofi)            |
| SUPER + U          | Rebuild system                 |

## System Controls

| Keybinding            | Action                       |
| --------------------- | ---------------------------- |
| CTRL + ALT + Delete   | Open system monitor (`btop`) |
| SUPER + ALT + L       | Lock screen                  |
| SUPER + Backspace     | Power menu (`wlogout`)       |
| SUPER + Delete        | Exit Hyprland session        |
| CTRL + Escape         | Toggle Waybar                |
| SUPER + ALT + K       | Change keyboard layout       |
| SUPER + SHIFT + N / Q | Open notification panel      |

## Night Mode

| Keybinding  | Action                           |
| ----------- | -------------------------------- |
| SUPER + F9  | Enable night mode (`hyprsunset`) |
| SUPER + F10 | Disable night mode               |

## Clipboard / Picker Tools

| Keybinding       | Action                       |
| ---------------- | ---------------------------- |
| SUPER + CTRL + C | Colour picker (`hyprpicker`) |
| SUPER + V        | Clipboard manager            |

## Window Management

| Keybinding                        | Action                                |
| --------------------------------- | ------------------------------------- |
| SUPER + W                         | Toggle floating mode                  |
| SUPER + SHIFT + G                 | Toggle window group                   |
| ALT + Return                      | Toggle fullscreen                     |
| SUPER + Q / ALT + F4              | Close active window (Steam protected) |
| SUPER + SHIFT + H/J/K/L or arrows | Resize window in direction            |
| SUPER + CTRL + SHIFT + Arrows     | Move window in direction              |
| SUPER + Left/Right Click          | Move/Resize window with mouse         |
| SUPER + SHIFT + CTRL + Arrows     | Move window with mouse                |

## Workspace Management

| Keybinding                | Action                            |
| ------------------------- | --------------------------------- |
| SUPER + CTRL + Left/Right | Switch to previous/next workspace |
| SUPER + CTRL + Down       | Switch to first empty workspace   |
| SUPER + CTRL + S          | Move window to scratchpad         |
| SUPER + S                 | Toggle scratchpad workspace       |
| SUPER + Tab               | Cycle next window / Bring to top  |
| SUPER + 1-0               | Switch to workspace 1–10          |
| SUPER + SHIFT + 1-0       | Move to workspace 1–10            |
| SUPER + SHIFT + 1-0       | Silently move to workspace 1–10   |

## Focus Management

| Keybinding            | Action                  |
| --------------------- | ----------------------- |
| SUPER + Arrows / HJKL | Move focus in direction |
| ALT + Tab             | Move focus down         |

## Game Mode

| Keybinding      | Action           |
| --------------- | ---------------- |
| SUPER + ALT + G | Enable game mode |


> [!IMPORTANT]
> # Rebuilding
> There are 4 ways to rebuild.<br>
> 1) Press **Super + U**.
> 2) Run `rebuild` in the terminal
> 3) Execute the `install.sh` script again.
> 4) Run `sudo nixos-rebuild switch --flake ~/NixOS#Default` if you installed from the live iso then use /etc/nixos#Default 


<details>
<summary>How to Use the Development Shells</summary>

- To initialise a new project from a template:
```bash
nix flake init -t ~/NixOS#NAME
```
- Alternatively, use the `new` keyword to create a new directory:
```bash
nix flake new -t ~/NixOS#NAME PROJECT_NAME
```
Replace `NAME` with any template defined in `dev-shells/default.nix`.<br>
These commands will generate a flake.nix and flake.lock file in your project directory.<br>
To enter the development shell:
- Use direnv if configured, or navigate to the project directory and run:
```bash
nix develop
```
</details> 

<!-- </details> -->
<!-- <summary>Credits/Inspiration</summary> -->

### Credits/Inspiration
| Credit                                                        | Reason                                 |
| ------------------------------------------------------------- | -------------------------------------- |
| [Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots)    | Script and Waybar templates            |
| [HyDE](https://github.com/HyDE-Project/HyDE)                  | Some more useful scripts               |
| [rofi](https://github.com/adi1090x/rofi)                      | Rofi launcher templates                |
| [dev-templates](https://github.com/the-nix-way/dev-templates) | Development templates                  |
| [Vimjoyer](https://www.youtube.com/@vimjoyer)                 | Short, simple, concise guides and info |

<!-- </details> -->

