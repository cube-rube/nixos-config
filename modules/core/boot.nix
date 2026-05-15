{
  flake.modules.nixos.boot = {
    boot.loader.limine.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
