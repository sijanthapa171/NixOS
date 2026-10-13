{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Java runtime (Minecraft requires Java 21+ for 1.21)
    jdk21

    # Admin / monitoring
    git
    curl
    wget
    jq
    htop
    tmux
    mcrcon # Send RCON commands from CLI: mcrcon -H localhost -P 25575 -p <pass> "list"

    # Backup helpers
    rsync
    gzip
    zstd
  ];
}
