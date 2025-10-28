let
  username = "Sylveon";
  description = "Sylveon SV";
in {
  zaphkiel.data.users = [username];
  users.users.${username} = {
    inherit description;
    isNormalUser = true;
    # extraGroups = ["networkmanager" "wheel" "multimedia"];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBlB7+ziR/1Wcvx/QvVGfI0x/84DjJQzgbUn0/SiGzyj sylveonsv@gmail.com"
    ];
  };
}
