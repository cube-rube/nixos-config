{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ firefox ];
  home-manager.sharedModules = [{
    programs.floorp = {
      enable = true;
      nativeMessagingHosts = with pkgs; [ keepassxc ];
    };
  }];
}
