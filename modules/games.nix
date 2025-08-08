{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    prismlauncher
    packwiz
    ferium
    modrinth-app

    itch
    the-powder-toy
  ];
  programs.steam.enable = true;
}
