{ config, inputs, ... }: {
  flake.modules.nixos.desktop = config.flake.modules.nixos.browsers;
  flake.modules.nixos.browsers =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.firefox
        pkgs.google-chrome
      ];
    };

  flake.modules.hjem.desktop.imports = [
    config.flake.modules.hjem.floorp
    config.flake.modules.hjem.helium
  ];

  flake.modules.hjem.floorp =
    { lib, pkgs, ... }:
    let
      inherit (lib.lists) singleton;
    in
    {
      packages = singleton pkgs.floorp-bin;
    };

  flake.modules.hjem.helium =
    { lib, osConfig, ... }:
    let
      inherit (lib.lists) singleton;
      inherit (lib.trivial) flip const;
      inherit (lib.attrsets) genAttrs;
    in
    {
      packages = singleton inputs.helium.packages.${osConfig.nixpkgs.hostPlatform.system}.default;

      xdg.mime-apps.default-applications = flip genAttrs (const "helium.desktop") [
        "x-scheme-handler/http"
        "x-scheme-handler/https"
        "text/html"
      ];
    };
}
