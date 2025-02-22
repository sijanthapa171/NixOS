{ user, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.options = "grp:win_caps_toggle";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${user}";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
