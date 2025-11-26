{
  flake.aspects.browser = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.firefox
          pkgs.google-chrome
        ];
        home-manager.sharedModules = [
          {
            programs.floorp = {
              enable = true;
              nativeMessagingHosts = [ pkgs.keepassxc ];
            };
          }
        ];
      };
  };
}
