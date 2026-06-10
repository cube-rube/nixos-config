{
  flake.modules.nixos.probe-rs =
    { pkgs, ... }:
    {
      services.udev.packages = [
        pkgs.openocd
        pkgs.probe-rs-tools
      ];
    };
}
