{ username
, hostname
, locale
, timezone
, terminal
, layout
, variant
, ...
}: {
  imports = [
    ../common.nix
    ../../modules/desktop/hyprland
    ../../modules/programs/games
    ../../modules/hardware/video/amdgpu.nix
    ./hardware-configuration.nix
  ];

  home-manager.users.${username} = {
    home.sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = terminal;
    };
  };

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  time.timeZone = timezone;

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  services.xserver = {
    enable = true;
    xkb = {
      inherit layout;
      inherit variant;
    };
  };

  console.keyMap = layout;

  services.printing.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "kvm"
      "input"
      "disk"
      "libvirtd"
      "video"
      "audio"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
