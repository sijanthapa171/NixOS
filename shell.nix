{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    git
    nix
    home-manager
  ];
  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
}
