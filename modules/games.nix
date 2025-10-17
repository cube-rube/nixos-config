{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    prismlauncher
    packwiz
    ferium
    modrinth-app
    r2modman
    lumafly
    itch
    the-powder-toy
  ];
  programs.steam.enable = true;
}
