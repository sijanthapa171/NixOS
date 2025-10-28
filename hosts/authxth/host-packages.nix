{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core developer tooling used throughout the repo
    git
    zsh
    starship
    direnv
    fd
    ripgrep
    bat
    eza
    tmux
    neovim
    python39
    nodejs
    go
    rustc
    cargo
    jq

    # Containers (may require Docker Desktop on Windows/WSL integration)
    docker
    podman

    # Utilities
    microfetch
    fastfetch
  ];
}
