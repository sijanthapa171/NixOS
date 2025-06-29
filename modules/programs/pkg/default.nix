{config, lib, pkgs, ...}:

{
  imports = [
    ./brave
    ./google-chrome
    ./libreoffice
    ./obsidian
    ./vscode
    ./tgpt
    ./bat
    ./cmatrix
    ./trok
  ];
} 