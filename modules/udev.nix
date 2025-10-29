{ pkgs, ... }: {
  services.udev.packages = [ pkgs.openocd ];
}
