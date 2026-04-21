{ pkgs, ... }:
let
  tex = (
    pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-full
        dvisvgm
        dvipng # for preview and export as html
        wrapfig
        amsmath
        ulem
        hyperref
        capt-of
        xelatex-dev
        ;
    }
  );
in
{
  environment.systemPackages = [
    pkgs.asciinema
    pkgs.cowsay
    pkgs.lolcat
    pkgs.terminaltexteffects
    pkgs.fastfetch

    pkgs.tokei
    pkgs.yazi
    pkgs.bc
    pkgs.sioyek

    pkgs.pciutils
    pkgs.usbutils
    pkgs.fd
    pkgs.ripgrep
    pkgs.dust
    pkgs.just
    pkgs.htop
    pkgs.dex

    # pgks.aseprite
    pkgs.webcamoid
    pkgs.krita
    pkgs.mpv
    pkgs.qbittorrent-enhanced
    pkgs.obsidian
    pkgs.spotify
    pkgs.kdePackages.kcalc
    pkgs.cables
    tex
    pkgs.typst
    pkgs.amneziawg-tools
    pkgs.easyeffects

    pkgs.libreoffice-qt-fresh
    pkgs.hunspell
    pkgs.hunspellDicts.en_US-large
    pkgs.hunspellDicts.ru_RU
    pkgs.hyphenDicts.en_US
    pkgs.hyphenDicts.ru_RU

    pkgs.cisco-packet-tracer_9

    pkgs.gdb
    pkgs.lldb
    
    # asm
    pkgs.fasm

    # C/C++
    pkgs.gcc
    pkgs.clang
    pkgs.clang-tools
    pkgs.gnumake

    # Python
    pkgs.python3
    pkgs.uv

    # Web stuff
    pkgs.deno
    pkgs.gleam
  ];

  fonts.packages = [
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-color-emoji
  ];

  # home-manager.sharedModules = [{
  #   programs.fastfetch.enable = true;
  #   programs.fd.enable = true;
  # }];
}
