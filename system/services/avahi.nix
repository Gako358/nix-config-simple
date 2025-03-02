{pkgs, ...}: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      workstation = true;
      userServices = true;
    };
    # Add these lines:
    extraServiceFiles = {
      ssh = "${pkgs.avahi}/etc/avahi/services/ssh.service";
    };
    # Explicitly set your domain
    domainName = "math";
  };
}
