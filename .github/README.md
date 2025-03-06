<h1 align="center">
   <img src="assets/nixos-logo.png" width="100px" /> 
   <br>
      My NixOS system
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

   <div align="center">
      <p></p>
      <div align="center">
         <a href="https://github.com/thapasijan17/NixOS/stargazers">
            <img src="https://img.shields.io/github/stars/thapasijan17/NixOS?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6">
         </a>
         <a href="https://github.com/thapasijan17/NixOS/">
            <img src="https://img.shields.io/github/repo-size/thapasijan17/NixOS?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6">
         </a>
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-Unstable-blue?style=for-the-badge&logo=NixOS&logoColor=white&label=NixOS&labelColor=303446&color=91D7E3">
            <!-- <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3"> -->
         </a>
      </div>
      <br>
   </div>
</h1>


# Installation
> [!Note]
> <p>You should review the configuration variables in flake.nix before installing.</p>
<!-- ## Using the install script -->
```bash
nix run --experimental-features "nix-command flakes" nixpkgs#git clone https://github.com/thapasijan17/NixOS.git ~/NixOS
```
```bash
cd ~/NixOS
```
```bash
./install.sh
```
For a list of keybinds press Super + ? or Super + Ctrl + K
<details>
<summary>How to use the dev-shells</summary>

```bash
nix flake init -t ~/NixOS#NAME
```
or use the "new" keyword to initialise a new directory
```bash
nix flake new -t ~/NixOS#NAME PROJECT_NAME
```
where NAME is any of the templates defined in dev-shells/default.nix
</details>

## Building manually
> [!IMPORTANT]
> <p>When building manually from the flake make sure to place your hardware-configuration.nix in hosts/Default/<br>
> then change the username variable in flake.nix with your username!! THIS IS IMPORTANT<br>
> afterwards run the command below</p>
```bash
sudo nixos-rebuild switch --flake .#Default
``` 
