{
  perSystem =
    { config, pkgs, ... }:
    {
      packages.qhexview = pkgs.callPackage ./qhexview/_package.nix { };
      packages.libredasm = pkgs.callPackage ./libredasm/_package.nix { };
      packages.redasm = pkgs.callPackage ./_package.nix { inherit (config.packages) qhexview libredasm; };
    };
}
