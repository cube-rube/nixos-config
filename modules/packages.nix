{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    asciinema
    cowsay
    lolcat
    terminaltexteffects
    fastfetch

    pciutils
    fd

    aseprite
  ];

  # home-manager.sharedModules = [{
  #   programs.fastfetch.enable = true;
  #   programs.fd.enable = true;
  # }];
}
