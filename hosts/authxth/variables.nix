{
  # WSL-specific host variables derived from hosts/auth/variables.nix
  username = "sijanthapa"; # keep same username as other hosts
  desktop = "none"; # Not used for WSL
  terminal = "none"; # Terminal is the Windows Terminal / WT
  editor = "nixvim"; # prefer nixvim for consistency
  browser = "zen";
  tuiFileManager = "yazi";
  sddmTheme = "astronaut";
  wallpaper = "kurzgesagt";
  shell = "zsh";
  games = false; # WSL host doesn't need gaming module

  # Hardware / minimal
  videoDriver = "none"; # not applicable on WSL
  hostname = "authxth"; # requested hostname

  # Localization
  clock24h = true;
  locale = "en_US.UTF-8";
  timezone = "Asia/Kathmandu";
  kbdLayout = "us";
  kbdVariant = "";
  consoleKeymap = "us";
}
