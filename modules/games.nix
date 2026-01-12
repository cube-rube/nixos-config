{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.prismlauncher
    pkgs.packwiz
    pkgs.ferium
    pkgs.modrinth-app
    pkgs.r2modman
    pkgs.lumafly
    pkgs.itch
    pkgs.the-powder-toy
  ];
  programs.steam.enable = true;
  programs.steam.extraCompatPackages = [
    pkgs.proton-ge-bin
  ];
}
