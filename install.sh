#!/usr/bin/env bash

BOLD="\e[1m"
RESET="\e[0m"

TEXT="\e[38;2;198;160;246m"
ACCENT="\e[38;2;94;129;172m"
SUCCESS="\e[38;2;163;190;140m"
ERROR="\e[38;2;191;97;106m"

script_dir=$(realpath "$(dirname "$0")")
current_user=$(logname)
current_host=$(hostname)

function catppuccin_prompt()
{
    local text="$1 $2 $1"
    local text_length=${#text}
    local border=$(printf '─%.0s' $(seq 1 $((text_length + 2))))

    echo -e "${BOLD}${TEXT}╭${border}╮${RESET}"
    echo -e "${BOLD}${TEXT}│${ACCENT}${text}${TEXT}│${RESET}"
    echo -e "${BOLD}${TEXT}╰${border}╯${RESET}\n"
}

function show_success()
{
    echo -e "${SUCCESS}✔ $1 !${RESET}"
}

function show_error()
{
    echo -e "${ERROR}✖ $1.${RESET}"
    exit 84
}

function prompt_with_default()
{
    local prompt_message=$1
    local default_value=$2

    read -p "${prompt_message} [${default_value}]: " user_input
    echo "${user_input:-$default_value}"
}

function usage()
{
    cat << EOF
USAGE:

  ./install.sh
      -> install NixOS Hyprland

  ./install.sh -h|--help
      -> show this message

  ./install.sh -r|--rebuild
      -> rebuild NixOS dots
EOF
    exit 0
}

function nix_rebuild_dots()
{
    nix-shell --command "git add -A" || show_error "cannot add files to git tree"
    catppuccin_prompt "🚧" "BUILDING (this may take a while)"
    nix-shell --command "sudo nixos-rebuild switch --flake '$script_dir#Default' --show-trace" || show_error "an error occured... see logs for additional details "
    show_success "SUCCESS"
    exit 0
}

cd $script_dir || show_error "cannot move to directory $script_dir"

catppuccin_prompt "🌠" "Welcome to NixOS Hyprland installer"

if [[ $EUID -eq 0 ]]; then
	show_error "this script should not be executed as root! Exiting..."
fi

if [[ ! "$(grep -i nixos < /etc/os-release)" ]]; then
	show_error "this installation script only works on NixOS! Download an iso at https://nixos.org/download/"
fi

if [[ $# -gt 0 ]]; then
    case $1 in
        -r|--rebuild)
            nix_rebuild_dots
            ;;
        -h|--help)
            usage
            ;;
        *)
            show_error "invalid argument $1 !"
            ;;
    esac
fi

echo -e "sourcing your shell to shell.nix ..."
nix-shell > /dev/null 2>&1
echo -e "done"

show_success "Running install.sh from $script_dir"
show_success "Found user name: $current_user"
show_success "Found host name: $current_host"

catppuccin_prompt "💻" "Hello $current_user !"
locale=$(prompt_with_default "Enter your local" "fr_FR.UTF-8")
timezone=$(prompt_with_default "Enter your timezone" "Europe/Paris")
layout=$(prompt_with_default "Enter your keyboard layout" "fr")
variant=$(prompt_with_default "Enter your keyboard variant (can be \"\")" "azerty")

pushd "$script_dir"&> /dev/null || exit

sed -i -e 's/username = \".*\"/username = \"'"$current_user"'\"/' "$script_dir/flake.nix"
show_success "Changing flake.nix username to $current_user"
sed -i -e 's/locale = \".*\"/locale = \"'"$locale"'\"/' "$script_dir/flake.nix"
show_success "Changing flake.nix locale to $locale"
sed -i -e 's#timezone = ".*"#timezone = "'"$timezone"'"#' "$script_dir/flake.nix"
show_success "Changing flake.nix timezone to $timezone"
sed -i -e 's/hostname = \".*\"/hostname = \"'"$current_host"'\"/' "$script_dir/flake.nix"
show_success "Changing flake.nix hostname to $current_host"
sed -i -e 's/layout = \".*\"/layout = \"'"$layout"'\"/' "$script_dir/flake.nix"
show_success "Changing flake.nix layout to $layout"
sed -i -e 's/variant = \".*\"/variant = \"'"$variant"'\"/' "$script_dir/flake.nix"
show_success "Changing flake.nix variant to $variant"

rm -f $script_dir/hosts/Default/hardware-configuration.nix &>/dev/null

if [ -f "/etc/nixos/hardware-configuration.nix" ]; then
    show_success "Found hardware-configuration !"
    cat "/etc/nixos/hardware-configuration.nix" > "$script_dir/hosts/Default/hardware-configuration.nix"
else
  sudo nixos-generate-config --show-hardware-config > "$script_dir/hosts/Default/hardware-configuration.nix"
  show_success "Generated your hardware-configuration"
fi

catppuccin_prompt "🖌️" "Installing wallpapers..."
nix-shell --command "git clone https://github.com/Leorevoir/wallpapers.git $script_dir/modules/themes/wallpapers"
show_success "Installed wallpapers"

nix-shell --command "git -C $script_dir add *"
catppuccin_prompt "🚧" "BUILDING (this may take a while)"
nix-shell --command "sudo nixos-rebuild switch --flake "$script_dir#Default" || exit 84"

show_success "SUCCESS"
show_success "Make sure to reboot if this is your first installation"
catppuccin_prompt "⭕" "sudo reboot" 

popd "$script_dir" &> /dev/null || exit
