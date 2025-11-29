{
  flake.aspects.desktop = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.ayugram-desktop ];
      };
  };
}
