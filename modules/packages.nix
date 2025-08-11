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
    qbittorrent-enhanced
  ];

  # home-manager.sharedModules = [{
  #   programs.fastfetch.enable = true;
  #   programs.fd.enable = true;
  # }];
}
