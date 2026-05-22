{
  flake.modules.nixos.ides =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.jetbrains.pycharm-oss
      ];
    };
}
