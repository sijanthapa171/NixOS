{
  description = "A simple flake for an atomic system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-waybar-fix.url = "github:nixos/nixpkgs/c7b821ba2e1e635ba5a76d299af62821cbcb09f3";
    nur.url = "github:nix-community/NUR";
    nixvim = {
      url = "github:Leorevoir/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    swww = {
      url = "github:LGFae/swww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs
    , nixpkgs-stable
    , ...
    } @ inputs:
    let
      # User configuration
      username = "yutsuna";
      terminal = "kitty";

      # System configuration
      locale = "fr_FR.UTF-8";
      timezone = "Europe/Paris";
      hostname = "NixOS";
      layout = "fr";
      variant = "azerty";

      arguments = {
        inherit
          pkgs-stable
          username
          terminal
          system
          locale
          timezone
          hostname
          layout
          variant
          ;
      };

      system = "x86_64-linux";
      inherit (nixpkgs) lib;

      pkgs-stable = _final: _prev: {
        stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
          config.nvidia.acceptLicense = true;
        };
      };
    in
    {
      nixosConfigurations = {
        Default = lib.nixosSystem {
          inherit system;
          specialArgs =
            (arguments
            // { inherit inputs; })
            // inputs;
          modules = [
            ./hosts/Default/configuration.nix
          ];
        };
      };
    };
}
