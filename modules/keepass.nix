{ config, pkgs, ... }:
{
  # environment.systemPackages = with pkgs; [
  #   keepassxc
  # ];
  home-manager.sharedModules = [{
    programs.keepassxc.enable = true;
  }];
}
