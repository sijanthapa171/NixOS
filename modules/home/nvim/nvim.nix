{ inputs, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };
  xdg.configFile."nvim" = {
    source = "${inputs.nvim-conf}";
    recursive = true;
  };
}
