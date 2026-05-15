{
  flake.modules.nixos.wine =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.bottles
      ];
    };
}
