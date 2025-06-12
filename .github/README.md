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
         <a href="https://github.com/Leorevoir/NixOS/stargazers">
            <img src="https://img.shields.io/github/stars/Leorevoir/NixOS?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6">
         </a>
         <a href="https://github.com/Leorevoir/NixOS/">
            <img src="https://img.shields.io/github/repo-size/Leorevoir/NixOS?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6">
         </a>
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-Unstable-blue?style=for-the-badge&logo=NixOS&logoColor=white&label=NixOS&labelColor=303446&color=91D7E3">
         </a>
         <a href="https://github.com/Leorevoir/NixOS/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=F5A97F&logo=unlicense&logoColor=F5A97F&"/>
         </a>
      </div>
      <br>
   </div>
</h1>

![Screenshot](assets/wip_preview.png)
![Screenshot](assets/cyberpunk_preview.png)

# Install

> [!Note]
>
> <p>Default GPU drivers are AMD.<br>
> If you want to change this then edit the imports in ./hosts/Default/configuration.nix.</p>

## Using the install script

```bash
nix run --experimental-features "nix-command flakes" nixpkgs#git clone https://github.com/Leorevoir/NixOS.git ~/NixOS
```

```bash
cd ~/NixOS
```

```bash
./install.sh
```

## Rebuild when you make changes

```bash
./install.sh --rebuild
```

### Credits/Inspiration

https://github.com/Sly-Harvey/NixOS/
