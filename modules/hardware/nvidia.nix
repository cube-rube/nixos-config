{
  flake.aspects.nvidia = {
    nixos =
      { config, ... }:
      {
        hardware.nvidia = {
          modesetting.enable = true;
          powerManagement.enable = true;
          open = false; # old gpu
          nvidiaSettings = true;
          package = config.boot.kernelPackages.nvidiaPackages.stable;
        };

        services.xserver.videoDrivers = [ "nvidia" ];

        nixpkgs = {
          config.allowUnfree = true;
        };
      };
  };
}
