{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-basic
      dvisvgm dvipng # for preview and export as html
      wrapfig amsmath ulem hyperref capt-of;
  });
in {
  environment.systemPackages = with pkgs; [
    libreoffice-fresh
    tex

    typst
  ];
}
