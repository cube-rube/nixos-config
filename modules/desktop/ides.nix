{
  flake.aspects.desktop = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.jetbrains.pycharm-community
        ];
      };
  };
}
