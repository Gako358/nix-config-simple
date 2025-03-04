{
  services = {
    openssh = {
      enable = true;
      # Forbid root login through SSH.
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
      openFirewall = true;
    };
  };
}
