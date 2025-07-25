{
  pkgs,
  videoDriver,
  hostname,
  browser,
  editor,
  terminal,
  terminalFileManager,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/video/${videoDriver}.nix # Enable gpu drivers defined in flake.nix
    ../../modules/hardware/drives

    ../common.nix
    ../../modules/scripts
    ../../modules/programs/pkg # Import our new package configurations

    ../../modules/desktop/hyprland # Enable hyprland window manager
    # ../../modules/desktop/i3-gaps # Enable i3 window manager

    ../../modules/programs/games
    ../../modules/programs/browser/${browser} # Set browser defined in flake.nix
    ../../modules/programs/terminal/${terminal} # Set terminal defined in flake.nix
    ../../modules/programs/editor/${editor} # Set editor defined in flake.nix
    ../../modules/programs/cli/${terminalFileManager} # Set file-manager defined in flake.nix
    ../../modules/programs/cli/starship
    ../../modules/programs/cli/tmux
    ../../modules/programs/cli/direnv
    ../../modules/programs/cli/lazygit
    ../../modules/programs/cli/cava
    ../../modules/programs/cli/btop
    ../../modules/programs/shell/bash
    ../../modules/programs/shell/zsh
    ../../modules/programs/media/discord
    ../../modules/programs/media/spicetify
    # ../../modules/programs/media/youtube-music
    # ../../modules/programs/media/thunderbird
    ../../modules/programs/media/obs-studio
    ../../modules/programs/media/mpv
    ../../modules/programs/misc/tlp
    ../../modules/programs/misc/thunar
    ../../modules/programs/misc/lact # GPU fan, clock and power configuration
    # ../../modules/programs/misc/nix-ld
    ../../modules/programs/misc/virt-manager
    ../../modules/programs/wine
    ../../modules/programs/docker
  ];

  # Enable our modular package configurations
  modules.programs.pkg = {
    brave.enable = true;
    google-chrome.enable = true;
    libreoffice.enable = true;
    obsidian.enable = true;
    vscode = {
      enable = true;
      enableCursor = true;
    };
    tgpt.enable = true;
    bat.enable = true;
    cmatrix.enable = true;
    trok = {
      enable = true;
      # Uncomment and adjust these if you want to run a trok server
      # server = {
      #   enable = true;
      #   host = "0.0.0.0";
      #   port = 1337;
      #   openFirewall = true;
      #   user = "trok";
      #   group = "trok";
      # };
    };
    figma.enable = true;
  };

  # Home-manager config
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        # pokego # Overlayed
        # krita
        github-desktop
        # gimp
      ];
    })
  ];

  # Define system packages here
  environment.systemPackages = with pkgs; [
    
    #<-- Temp for NoteCLI
    # Build tools
    gcc
    gnumake
    cmake
    pkg-config

    # Testing tools
    cunit
    gtest
    lcov

    # Development tools
    clang-tools
    codespell
    conan
    cppcheck
    doxygen
    vcpkg
    vcpkg-tool
    nodejs
    go 
    hugo
    # --> Temp
  ];

  networking.hostName = hostname; # Set hostname defined in flake.nix

  # Stream my media to my devices via the network
  services.minidlna = {
    enable = true;
    openFirewall = true;
    settings = {
      friendly_name = "NixOS-DLNA";
      media_dir = [
        # A = Audio, P = Pictures, V, = Videos, PV = Pictures and Videos.
        # "A,/mnt/work/Pimsleur/Russian"
        "/mnt/work/Pimsleur"
        "/mnt/work/Media/Films"
        "/mnt/work/Media/Series"
        "/mnt/work/Media/Videos"
        "/mnt/work/Media/Music"
      ];
      inotify = "yes";
      log_level = "error";
    };
  };
  users.users.minidlna = {
    extraGroups = ["users"]; # so minidlna can access the files.
  };
}
