{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    asciinema
    cowsay
    lolcat
    terminaltexteffects
    fastfetch
    
    tokei
    yazi
    bc
   
    lazygit
    git
    gh

    pciutils
    fd

    # aseprite
    qbittorrent-enhanced
    obsidian
    cables

    # C/C++
    gcc
    clang
    clang-tools    
    gnumake

    # Python
    python3
    uv
  ];

  # home-manager.sharedModules = [{
  #   programs.fastfetch.enable = true;
  #   programs.fd.enable = true;
  # }];
}
