{
  flake.aspects =
    { aspects, ... }:
    {
      system = {
        includes = [
          aspects.boot
          aspects.locale
          aspects.xdg
          aspects.home-clean
          aspects.network
          aspects.docs
        ];
      };
    };
}
