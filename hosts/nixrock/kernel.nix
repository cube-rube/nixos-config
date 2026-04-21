{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    akvcam
    v4l2loopback
    amneziawg
  ];
  services.kmscon = {
    enable = true;
    hwRender = true;
    useXkbConfig = true;
    fonts = [ { name = "Jetbrains Mono Nerd"; package = pkgs.nerd-fonts.jetbrains-mono; } ];
  };
  # boot.kernelModules = [
  #   "akvcam"
  #   "v4l2loopback"
  # ];
  # boot.kernelPatches = [ {
  #   name = "vt-less-config";
  #   patch = null;
  #   extraConfig = ''
  #       VT n
  #     '';
  # } ];
  # services.scx.enable = true;
}
