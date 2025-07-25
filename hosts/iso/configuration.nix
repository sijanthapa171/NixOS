# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').
{
  config,
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  # Enable copying the NixOS configuration to the installed system
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;
  isoImage.squashfsCompression = "gzip -Xcompression-level 9";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;  # Disable wpa_supplicant

  # Set your time zone
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the OpenSSH daemon
  services.openssh.enable = true;

  # Enable DHCP globally
  networking.useDHCP = lib.mkDefault true;

  # Add some useful tools for installation
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    htop
    parted
    gparted
    tmux
    pciutils
    usbutils
  ];

  # Allow unfree packages in the ISO
  nixpkgs.config.allowUnfree = true;

  # Explicitly disable insecure packages
  nixpkgs.config.permittedInsecurePackages = [];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
} 