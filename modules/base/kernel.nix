{
  flake.aspects.base = {
    nixos =
      { pkgs, ... }:
      {
        boot.kernelPackages = pkgs.linuxPackages_latest;
      };
  };
}
