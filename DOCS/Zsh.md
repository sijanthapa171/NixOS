# Zsh Keybinding Documentation

This document provides an overview of the keybindings set in the provided Zsh configuration.

## General Keybindings

| Keybinding        | Function Description |
|-------------------|---------------------|
| `Esc + w`        | Kill from the cursor to the mark |
| `Esc + l`        | Run `ls` command |
| `Space`          | Prevent history expansion |
| `Ctrl + x Ctrl + e` | Edit the current command line in `$EDITOR` |
| `Esc + m`        | Copy previous shell word |

## Navigation and History Search

| Keybinding        | Function Description |
|-------------------|---------------------|
| `PageUp`         | Move up a line in history |
| `PageDown`       | Move down a line in history |
| `Up Arrow`       | Fuzzy find history forward |
| `Down Arrow`     | Fuzzy find history backward |
| `Ctrl + RightArrow` | Move forward one word |
| `Ctrl + LeftArrow`  | Move backward one word |

## Word Deletion and Manipulation

| Keybinding        | Function Description |
|-------------------|---------------------|
| `Ctrl + Delete`  | Delete whole forward-word |
| `Ctrl + w`       | Custom backward delete word (stops at `:`, `/`, `.` and `-`) |

## Custom Commands

| Keybinding        | Function Description |
|-------------------|---------------------|
| `Esc + f`        | Run `tmux-sessionizer` |
| `Esc + g`        | Run `git-sessionizer` |

## Additional Notes
- The configuration uses Emacs keybindings (`bindkey -e`).
- `WORDCHARS` is modified to customize word boundaries.
- `my-backward-delete-word` custom function is created to refine `Ctrl + w` behavior.
- `edit-command-line` allows editing the current command in the default editor.

