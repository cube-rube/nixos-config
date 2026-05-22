{
  flake.modules.nixos.ssh-client = {
    programs.ssh = {
      startAgent = true;
      enableAskPassword = true;
    };

    environment.variables = {
      SSH_ASKPASS_REQUIRE = "prefer";
    };
  };

  flake.modules.nixos.ssh-server = {
    services.openssh = {
      enable = true;
      ports = [ ];
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
  };
}
