{
  flake.aspects.desktop = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.bottles
        ];
      };
  };
}
