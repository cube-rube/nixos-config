{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    floorp
    firefox
  ];
  programs.firefox.enable = true;
}
