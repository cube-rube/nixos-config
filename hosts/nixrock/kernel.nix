{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = [
    config.boot.kernelPackages.akvcam
    config.boot.kernelPackages.v4l2loopback
  ];
  boot.kernelModules = [
    "akvcam"
    "v4l2loopback"
  ];
  # boot.kernelPatches = [ {
  #   name = "vt-less-config";
  #   patch = null;
  #   extraConfig = ''
  #       VT n
  #     '';
  # } ];
  # services.scx.enable = true;
}
