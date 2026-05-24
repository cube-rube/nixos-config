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
      inherit (lib.trivial) flip const;
      inherit (lib.attrsets) genAttrs;
    in
    {
      packages = singleton pkgs.floorp-bin;

      xdg.mime-apps.default-applications = flip genAttrs (const "floorp.desktop") [
        "x-scheme-handler/http"
        "x-scheme-handler/https"
        "text/html"
      ];
    };
}
