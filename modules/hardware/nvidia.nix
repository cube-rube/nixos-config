{
  flake.modules.nixos.nvidia =
    { config, ... }:
    {
      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        open = false; # old gpu
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
      };

      services.xserver.videoDrivers = [ "nvidia" ];

      nixpkgs = {
        config.allowUnfree = true;
      };
    };
}
