{ config, ... }: {
  flake.modules.nixos.desktop = config.flake.modules.nixos.telegram;
  flake.modules.nixos.telegram =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.ayugram-desktop ];
    };
}
