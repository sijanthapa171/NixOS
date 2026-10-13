{
  username = "sijanthapa";

  # Shell / Editor
  editor = "nixvim"; # nixvim, vscode
  shell = "zsh"; # zsh, bash

  # Hardware
  hostname = "server";
  videoDriver = "intel"; # nvidia, amdgpu, intel

  # Localization
  timezone = "Asia/Kathmandu";
  locale = "en_US.UTF-8";
  clock24h = true;
  kbdLayout = "us";
  kbdVariant = "";
  consoleKeymap = "us";
  capslockAsESC = false;

  # Server-specific
  # Domain used for nginx virtual hosts and TLS certificates.
  # Set to a real domain in production; use "localhost" for local-only.
  domain = "example.com";

  # Ports exposed on this host
  frontendPort = 3000; # Node/Bun/Deno SPA or SSR app
  backendPort = 8000; # API server (Go, Node, etc.)
  dbPort = 5432; # PostgreSQL
}
