{
  flake.aspects.wine = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.bottles
        ];
      };
  };
}
