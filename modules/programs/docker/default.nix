{pkgs, ...}: {
  # Enable Docker support
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  # Add user to the docker group to run docker commands without sudo
  users.users.sijanthapa.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];
} 