# NixOS Configuration System
## 🚀 Installation

### Quick Start

1. **Clone the Repository**
   ```bash
   git clone https://github.com/sijanthapa171/NixOS.git
   cd NixOS
   ```

2. **Review Configuration**
   ```bash
   # Edit flake.nix to set your preferences
   nvim flake.nix
   ```

3. **Installation Options**

   For existing NixOS systems:
   ```bash
   ./install.sh
   ```

   For fresh installations:
   ```bash
   ./live-install.sh
   ```

4. **Post-Installation**
   ```bash
   # Rebuild and switch to the new configuration
   sysup
   ```
  
