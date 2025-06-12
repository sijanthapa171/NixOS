{ inputs
, pkgs
, ...
}: {
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        inputs.swww.packages.${system}.swww
      ];
    })
  ];
}
