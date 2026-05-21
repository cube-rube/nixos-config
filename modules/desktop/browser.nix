{
  flake.modules.nixos.browser =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.firefox
        pkgs.google-chrome
      ];
    };

  flake.modules.home-manager =
    { pkgs, ... }:
    {
      programs.floorp = {
        enable = true;
        nativeMessagingHosts = [ pkgs.keepassxc ];
      };
    };

  flake.modules.hjem.floorp =
    { lib, pkgs, ... }:
    let
      inherit (lib.lists) singleton;
    in
    {
      packages = singleton pkgs.floorp-bin;
    };
}
