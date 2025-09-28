{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    asciinema
    cowsay
    lolcat
    terminaltexteffects
    fastfetch
    
    eza
    tokei
    yazi
    bc
   
    lazygit
    git
    gh

    pciutils
    fd

    aseprite
    qbittorrent-enhanced
    obsidian
  ];

  # home-manager.sharedModules = [{
  #   programs.fastfetch.enable = true;
  #   programs.fd.enable = true;
  # }];
}
