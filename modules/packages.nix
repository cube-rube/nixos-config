{ pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-full
      dvisvgm dvipng # for preview and export as html
      wrapfig amsmath ulem hyperref capt-of
      xelatex-dev;
  });
in {
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
    just

    # aseprite
    krita
    qbittorrent-enhanced
    obsidian
    cables
    libreoffice-fresh
    tex
    typst

    # asm
    fasm

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
