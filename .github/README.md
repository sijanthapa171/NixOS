<h1 align="center">
   <img src="assets/nixos-logo.png" width="100px" /> 
   <br> :snowflake:
      My NixOS system
   :snowflake:
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

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
