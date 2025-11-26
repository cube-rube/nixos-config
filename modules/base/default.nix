{
  flake.aspects =
    { aspects, ... }:
    {
      base = {
        includes = [
          aspects.boot
          aspects.locale
          aspects.xdg
          aspects.home-clean
          aspects.network
          aspects.docs
          aspects.kernel

          aspects.nix
          aspects.nix-ld
        ];
      };
    };
}
