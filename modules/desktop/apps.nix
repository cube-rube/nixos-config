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
        (pkgs.orca-c.overrideAttrs (old: {
          version = "unstable-2025-04-15";
          src = pkgs.fetchgit {
            url = "https://git.sr.ht/~rabbits/orca";
            rev = "9ec55aa88d5a3abab58ef229aeecaaccaab8f517";
            sha256 = "sha256-HC6V1w/KN1Zerl2ferVQcbx11V4+nRhCi7Z/EV/4Osk=";
          };
        }))

        pkgs.jetbrains.idea-oss
        pkgs.jetbrains.pycharm-oss
        pkgs.zed-editor

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
