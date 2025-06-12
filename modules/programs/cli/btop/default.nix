{
  home-manager.sharedModules = [
    (_: {
      programs.btop = {
        enable = true;
      };
    })
  ];
}
