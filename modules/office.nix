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
    libreoffice-fresh
    tex

    typst
  ];
}
