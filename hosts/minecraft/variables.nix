{
  username = "sijanthapa";

  editor = "nixvim"; # nixvim, vscode
  shell = "zsh"; # zsh, bash

  hostname = "minecraft";
  videoDriver = "intel"; # nvidia, amdgpu, intel

  timezone = "Asia/Kathmandu";
  locale = "en_US.UTF-8";
  clock24h = true;
  kbdLayout = "us";
  kbdVariant = "";
  consoleKeymap = "us";
  capslockAsESC = false;

  serverType = "fabric";

  mcVersion = "1.21.1";

  jvmInitHeap = "2G"; # -Xms
  jvmMaxHeap = "6G"; # -Xmx

  mcPort = 25565;

  rconPort = 25575;
  rconPassword = "changeme_rcon"; # change before deploying!

  serverDir = "/srv/minecraft";

  maxPlayers = 20;

  enableQuery = true;
}
