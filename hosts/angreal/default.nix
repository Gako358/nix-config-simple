{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "angreal";
  users.users = {
    matheus = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = ["wheel" "networkmanager" "docker" "libvirtd" "video" "audio" "plugdev"];
    };
  };
}
