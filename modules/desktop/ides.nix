{
  flake.aspects.ides = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.jetbrains.pycharm-community
        ];
      };
  };
}
