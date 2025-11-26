{
  flake.aspects.telegram = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.ayugram-desktop ];
      };
  };
}
