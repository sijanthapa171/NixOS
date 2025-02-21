{
  description = "Nixos config for nerds and anti-mouse guys";

  inputs = {
    # nixos-unstable channel
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    # hhypr-contrib
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprmag.url = "github:SIMULATAN/hyprmag";
    # nur - nix user repository
    nur = {
      url = "github:nix-community/NUR";
    };
    # code-formatter for nix
    alejandra = {
      url = "github:kamadorueda/alejandra/3.1.0";
    };
    # hyprland
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    # yazi file-manager plugins
    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };
    # Home-Manager setup for configurations
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # zig
    zig = {
      url = "github:mitchellh/zig-overlay";
    };
    # nvf- neovim config manager
    nix-colors = {
      url = "github:Misterio77/nix-colors";
    };
    nvim-conf = {
      url = "github:thapasijan17/nvim";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      user = "sijanthapa";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        lib = nixpkgs.lib;
      };
    in
    {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            host = "laptop";
            inherit
              self
              inputs
              user
              ;
          };
          modules = [
            ./hosts/laptop
          ];
        };
      };
    };
}
