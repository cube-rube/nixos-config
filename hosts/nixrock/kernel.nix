{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPatches = [ {
  #   name = "vt-less-config";
  #   patch = null;
  #   extraConfig = ''
  #       VT n
  #     '';
  # } ];
  # services.scx.enable = true;
}
