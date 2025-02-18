{
  pkgs,
  inputs,
  user,
  host,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs user host; };
    users.${user} = {
      imports = [ ./../home ];
      home.username = "${user}";
      home.homeDirectory = "/home/${user}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "video"
      "audio"
    ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "${user}" ];
}
