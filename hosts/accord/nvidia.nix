{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.libva-utils
    pkgs.vdpauinfo
    pkgs.vulkan-tools
    pkgs.vulkan-validation-layers
    pkgs.libvdpau-va-gl
    pkgs.egl-wayland
    pkgs.wgpu-utils
    pkgs.mesa
    pkgs.libglvnd
    pkgs.nvtopPackages.nvidia
    pkgs.nvtopPackages.intel
    pkgs.nvitop
    pkgs.libGL
  ];

  nixpkgs.config.nvidia.acceptLicense = true;

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
    modesetting.enable = true;
    prime = {
      # sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [
    # "intel"
    "nvidia"
  ];
  services.xserver.logFile = "/var/log/Xorg.0.log";

  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  boot.kernelParams = [
    "nvidia-drm.fbdev=1"
  ];
}
