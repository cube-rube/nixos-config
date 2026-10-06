{ config, ... }: {
  flake.modules.hjem.desktop = config.flake.modules.hjem.keepassxc;
  flake.modules.hjem.keepassxc =
    {
      lib,
      pkgs,
      ...
    }:
    let
      inherit (lib.lists) singleton;
    in
    {
      packages = singleton pkgs.keepassxc;
      xdg.mime-apps.default-applications."application/x-keepass2" = "org.keepassxc.KeePassXC.desktop";
    };
}
