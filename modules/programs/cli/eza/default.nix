{ pkgs
, ...
}:
{
  home-manager.sharedModules = [
    (_: {
      programs.bat = {
        enable = true;
      };
      home = {
        file = {
          ".config/eza/theme.yml".source = ./mocha.yml;
        };
        shellAliases = with pkgs; {
          l = "${eza}/bin/eza -lh  --icons=auto";
          ls = "${eza}/bin/eza   --icons=auto";
          ll = "${eza}/bin/eza -lha --icons=auto --sort=name --group-directories-first";
          ld = "${eza}/bin/eza -lhD --icons=auto";
          tree = "${eza}/bin/eza --icons=auto --tree";
        };
      };
    })
  ];
}
