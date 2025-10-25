{
  services.openssh = {
    enable = true;
    ports = [];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "cuberub" ];
      LogLevel = "VERBOSE";
    };
  };
  services.fail2ban = {
    enable = true;
  };
}
