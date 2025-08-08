{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libva-utils
    vdpauinfo
    vulkan-tools
    vulkan-validation-layers
    libvdpau-va-gl
    egl-wayland
    wgpu-utils
    mesa
    libglvnd
    nvtopPackages.nvidia
    nvtopPackages.intel
    nvitop
    libGL
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
