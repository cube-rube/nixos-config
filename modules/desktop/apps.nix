{
  flake.modules.nixos.apps =
    { pkgs, ... }:
    let
      tex = pkgs.texlive.combine {
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
      };
    in
    {
      environment.systemPackages = [
        pkgs.webcamoid
        pkgs.krita
        pkgs.blockbench
        pkgs.aseprite
        pkgs.mpv
        pkgs.qbittorrent-enhanced
        pkgs.obsidian
        pkgs.spotify
        pkgs.kdePackages.kcalc
        pkgs.kdePackages.kdenlive
        pkgs.cables
        tex
        pkgs.typst
        pkgs.sioyek
        pkgs.easyeffects
        pkgs.cpu-x
        pkgs.obs-studio
        pkgs.jetbrains.idea-oss
        pkgs.jetbrains.pycharm-oss

        pkgs.libreoffice-qt-fresh
        pkgs.hunspell
        pkgs.hunspellDicts.en_US-large
        pkgs.hunspellDicts.ru_RU
        pkgs.hyphenDicts.en_US
        pkgs.hyphenDicts.ru_RU
      ];
      fonts.packages = [
        pkgs.noto-fonts
        pkgs.noto-fonts-cjk-sans
        pkgs.noto-fonts-color-emoji
      ];
    };
}
