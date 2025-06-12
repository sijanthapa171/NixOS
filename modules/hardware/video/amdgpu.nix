# This module is untested since i don't own an amd gpu!
{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
        libvdpau-va-gl
        vaapiVdpau
      ];
      extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
    };
  };
}
