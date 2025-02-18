#!/usr/bin/env bash

# Switch to a tmux session
switch_to() {
    if [[ -z $TMUX ]]; then
        if ! tmux attach-session -t "$1"; then
            exit 1
        fi
    else
        if ! tmux switch-client -t "$1"; then
            exit 1
        fi
    fi
}

# Check if a tmux session exists
has_session() {
    tmux list-sessions | grep -q "^$1:"
}

# Hydrate a tmux session with commands from .tmux-sessionizer
hydrate() {
    if [ -n "$2" ] && [ -f "$2/.tmux-sessionizer" ]; then
        tmux send-keys -t "$1" "source $2/.tmux-sessionizer" C-m
    elif [ -f "$HOME/.tmux-sessionizer" ]; then
        tmux send-keys -t "$1" "source $HOME/.tmux-sessionizer" C-m
    fi
}

# Main script
if [[ $# -eq 1 ]]; then
    selected=$1
else
    # Use fzf to select a directory
    selected=$(find ~/ ~/personal ~/projects -mindepth 1 -maxdepth 1 -type d | fzf)
fi

# Exit if no directory is selected
if [[ -z $selected ]]; then
    exit 0
fi

# Validate the selected path
if [ ! -d "$selected" ]; then
    exit 1
fi

# Generate session name
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# If tmux is not running, start a new session
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    hydrate "$selected_name" "$selected"
    exit 0
fi

# If the session does not exist, create it
if ! has_session "$selected_name"; then
    tmux new-session -ds "$selected_name" -c "$selected"
    hydrate "$selected_name" "$selected"
fi

# Switch to the session
switch_to "$selected_name"

