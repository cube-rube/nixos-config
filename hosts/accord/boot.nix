{ config, pkgs, ... }:
{
  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.limine.extraConfig = ''
    /Windows
      protocol: efi
      path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
  '';

  # Kernel
  # boot.kernelPackages = pkgs.linuxPackages_6_15;
}
