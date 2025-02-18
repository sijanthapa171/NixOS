#!/usr/bin/env bash

# Function to switch to a tmux session
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

# Function to check if a tmux session exists
has_session() {
    tmux list-sessions | grep -q "^$1:"
}

# Function to hydrate a tmux session with commands from .tmux-sessionizer
hydrate() {
    if [ -n "$2" ] && [ -f "$2/.tmux-sessionizer" ]; then
        tmux send-keys -t "$1" "source $2/.tmux-sessionizer" C-m
    elif [ -f "$HOME/.tmux-sessionizer" ]; then
        tmux send-keys -t "$1" "source $HOME/.tmux-sessionizer" C-m
    fi
}

# Fetch GitHub repositories using GitHub CLI
REPOS=$(gh repo list --limit 100 | awk '{print $1}')

# Use fzf to select a repository
SELECTED_REPO=$(echo "$REPOS" | fzf)

if [ -z "$SELECTED_REPO" ]; then
    echo "No repository selected."
    exit 1
fi

# Extract repository name
REPO_NAME=$(echo "$SELECTED_REPO" | awk -F'/' '{print $2}')

# Ask for confirmation to clone
read -p "Do you want to clone '$REPO_NAME'? (Y/n): " CHOICE

if [[ "$CHOICE" == "y" || "$CHOICE" == "Y" || -z "$CHOICE" ]]; then
    # Clone the repository
    gh repo clone "$SELECTED_REPO"
    echo "Repository cloned successfully!"

    # Set the selected directory to the cloned repository
    selected="$(pwd)/$(echo "$SELECTED_REPO" | awk -F'/' '{print $2}')"
else
    echo "Not cloned."
    exit 0
fi

# Validate the selected path
if [ ! -d "$selected" ]; then
    echo "Directory does not exist: $selected"
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
