# Troubleshooting Guide

A comprehensive guide to help you resolve common issues with your NixOS configuration.

## 📝 Table of Contents

- [Common Issues](#common-issues)
- [Hardware Problems](#hardware-problems)
- [Software Problems](#software-problems)
- [System Management](#system-management)
- [Recovery](#recovery)

## 🔍 Common Issues

### System Won't Boot

1. **Boot Loader Issues**
   ```bash
   # Rebuild boot loader configuration
   sudo nixos-rebuild boot --flake .#Default
   
   # Reinstall boot loader
   sudo nixos-install --no-root-passwd --flake .#Default
   ```

2. **Hardware Configuration Issues**
   - Check `hardware-configuration.nix`
   - Verify all necessary modules are loaded
   - Ensure correct filesystem configuration

### Graphics Problems

1. **NVIDIA Issues**
   ```nix
   {
     hardware.nvidia = {
       package = config.boot.kernelPackages.nvidiaPackages.stable;
       modesetting.enable = true;
       powerManagement.enable = true;
       open = false;
     };
   }
   ```

2. **Screen Tearing**
   ```nix
   {
     services.xserver = {
       deviceSection = ''
         Option "TearFree" "true"
       '';
     };
   }
   ```

### Audio Issues

1. **No Sound**
   ```nix
   {
     sound.enable = true;
     security.rtkit.enable = true;
     services.pipewire = {
       enable = true;
       alsa.enable = true;
       alsa.support32Bit = true;
       pulse.enable = true;
       jack.enable = true;
     };
   }
   ```

2. **Bluetooth Audio**
   ```nix
   {
     hardware.bluetooth = {
       enable = true;
       powerOnBoot = true;
     };
     services.blueman.enable = true;
   }
   ```

## 🖥️ Hardware Problems

### WiFi Issues

1. **Enable Network Manager**
   ```nix
   {
     networking = {
       networkmanager.enable = true;
       wireless.enable = false; # Disable wpa_supplicant
     };
   }
   ```

2. **Driver Issues**
   ```nix
   {
     boot.extraModulePackages = with config.boot.kernelPackages; [
       rtw89
     ];
   }
   ```

### Power Management

1. **Battery Drain**
   ```nix
   {
     services.tlp = {
       enable = true;
       settings = {
         CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
         PCIE_ASPM_ON_BAT = "powersupersave";
       };
     };
     powerManagement.powertop.enable = true;
   }
   ```

## 💻 Software Problems

### Package Issues

1. **Broken Dependencies**
   ```bash
   # Update flake lock file
   nix flake update
   
   # Clean old packages
   sudo nix-collect-garbage -d
   ```

2. **Conflicting Packages**
   ```nix
   {
     nixpkgs.config.allowUnfree = true;
     nixpkgs.config.permittedInsecurePackages = [
       "package-name"
     ];
   }
   ```

### Program Configuration

1. **Home Manager Issues**
   ```bash
   # Rebuild home-manager configuration
   home-manager switch --flake .#Default
   
   # Show home-manager trace
   home-manager switch --flake .#Default --show-trace
   ```

## 🛠️ System Management

### Disk Space Issues

1. **Clean Old Generations**
   ```bash
   # Remove old generations
   sudo nix-collect-garbage -d
   
   # Remove specific generation
   sudo nix-env --delete-generations old
   ```

2. **Optimize Store**
   ```bash
   # Optimize nix store
   sudo nix-store --optimize
   
   # Remove unused packages
   sudo nix-store --gc
   ```

### Performance Issues

1. **System Monitoring**
   ```nix
   {
     programs.htop.enable = true;
     programs.iotop.enable = true;
     programs.powertop.enable = true;
   }
   ```

2. **CPU Governor**
   ```nix
   {
     powerManagement.cpuFreqGovernor = "performance";
   }
   ```

## 🔄 Recovery

### Emergency Recovery

1. **Boot from Live USB**
   ```bash
   # Mount system
   sudo mount /dev/disk/by-label/nixos /mnt
   sudo mount /dev/disk/by-label/boot /mnt/boot
   
   # Chroot into system
   sudo nixos-enter --root /mnt
   ```

2. **Repair System**
   ```bash
   # Rebuild system
   nixos-rebuild switch --flake .#Default
   
   # Update channel
   sudo nix-channel --update
   ```

### Backup and Restore

1. **Create Backup**
   ```bash
   # Backup home directory
   tar -czf backup.tar.gz -C /home/username .
   
   # Backup configuration
   cp -r /etc/nixos/* backup/
   ```

2. **Restore System**
   ```bash
   # Restore configuration
   sudo cp -r backup/* /etc/nixos/
   
   # Rebuild system
   sudo nixos-rebuild switch --flake .#Default
   ```

## 📚 Additional Resources

- [NixOS Discourse](https://discourse.nixos.org)
- [NixOS Matrix Chat](https://matrix.to/#/#nixos:matrix.org)
- [NixOS Wiki](https://nixos.wiki)

## 🆘 Getting Help

If you're still experiencing issues:

1. Check the [NixOS Manual](https://nixos.org/manual/nixos/stable/)
2. Search the [NixOS Discourse](https://discourse.nixos.org)
3. Join the [NixOS Matrix Chat](https://matrix.to/#/#nixos:matrix.org)
4. File an issue on [GitHub](https://github.com/authxt/NixOS/issues) 