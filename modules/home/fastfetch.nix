{ pkgs, ... }:
{
  home.packages = (with pkgs; [ fastfetch ]);

  xdg.configFile."fastfetch/config.jsonc".text = ''
        {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "source": "~/nixos-config/assets/kyomi.png", // This will still be the Nix logo source for the main logo
        "width": 30,
        "height":15
      },
      "display": {
        "separator": " |", // Separator
        "color": "yellow"   // Text color
      },
      "modules": [
        {
          "type": "title", // Title module
          "color": {
            "user": "green", // User name color
            "at": "cyan",    // "@" symbol color
            "host": "blue"   // Hostname color
          }
        },
        "separator",
        {
          "type": "os", // OS info
            "key": "", // Replace with Nix-related symbol (You can adjust this to a specific Nix symbol or ASCII art)
          "keyColor": "cyan" // Cyan color for OS
        },
        {
          "type": "uptime", // Uptime info
          "key": "",
          "keyColor": "green" // Green color for uptime
        },
        {
          "type": "shell", // Shell info
          "key": "",
          "keyColor": "magenta" // Magenta color for shell
        },
        {
          "type": "wm", // Window manager info
          "key": "",
          "keyColor": "red" // Red color for window manager
        },
        {
          "type": "terminal", // Terminal info
          "key": "",
          "keyColor": "yellow" // Yellow color for terminal
        },
        {
          "type": "cpu", // CPU info
          "key": "",
          "keyColor": "cyan" // Cyan color for CPU
        },
        {
          "type": "gpu", // GPU info
          "key": "",
          "keyColor": "yellow" // Yellow color for GPU
        },
        {
          "type": "memory", // Memory info
          "key": "",
          "keyColor": "green" // Green color for memory
        },
        {
          "type": "disk", // Disk info
          "key": "",
          "keyColor": "magenta",
          "arguments": {
            "mountpoint": "/" // Mount point for root disk
          }
        },
        {
          "type": "disk", // Disk info for /home
          "key": "",
          "keyColor": "magenta",
          "arguments": {
            "mountpoint": "/home" // Mount point for home disk
          }
        },
        {
          "type": "battery", // Battery info
          "key": "",
          "keyColor": "yellow" // Yellow color for battery
        },
        "break",
        {
          "type": "colors" // Color settings
        }
      ]
    }
  '';
}
