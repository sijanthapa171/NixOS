{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [

      ## CLI utility
      ani-cli
      binsider
      bitwise # cli tool for bit / hex manipulation
      caligula # User-friendly, lightweight TUI for disk imaging
      docfd # TUI multiline fuzzy document finder
      eza # ls replacement
      entr # perform action when file change
      fd # find replacement
      ffmpeg
      file # Show file information
      gtt # google translate TUI
      gifsicle # gif utility
      gtrash # rm replacement, put deleted files in system trash
      hexdump
      imv # image viewer
      jq # JSON processor
      killall
      libnotify
      man-pages # extra man pages
      mimeo
      mpv # video player
      ncdu # disk space
      nitch # systhem fetch util
      nixd # nix lsp
      nixfmt-rfc-style # nix formatter
      openssl
      onefetch # fetch utility for git repo
      pamixer # pulseaudio command line mixer
      playerctl # controller for media players
      poweralertd
      ripgrep # grep replacement
      shfmt # bash formatter
      swappy # snapshot editing tool
      tdf # cli pdf viewer
      treefmt2 # project formatter
      tldr
      unzip
      valgrind # c memory analyzer
      yt-dlp-light
      xdg-utils
      xxd
      telegram-desktop
      vscode

      ## CLI
      cbonsai # terminal screensaver
      cmatrix
      pipes # terminal screensaver
      sl
      tty-clock # cli clock

      ## GUI Apps
      bleachbit # cache cleaner
      gimp
      nix-prefetch-github
      obs-studio
      pavucontrol # pulseaudio volume controle (GUI)
      vlc
      zenity
      xclip
      lf
      vesktop
      ghostty
      figma-linux

      # Languages
      gcc
      cmake
      clang-tools
      glibc
      stdenv
      gdb
      inputs.zig.packages.${system}.master
      zls
      gnumake
      luarocks
      luajit
      nodejs
      go
      rustup
      kitty
      python3
      python312Packages.ipython

      inputs.alejandra.defaultPackage.${system}
    ]
  );
}
