{ config, ... }:
{
  flake.modules.nixos.core = config.flake.modules.nixos.boot;
  flake.modules.nixos.boot = {
    boot.loader.limine.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
