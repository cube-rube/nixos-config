{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  # boot.kernelPatches = [ {
  #   name = "vt-less-config";
  #   patch = null;
  #   extraConfig = ''
  #       VT n
  #     '';
  # } ];
  # services.scx.enable = true;
}
