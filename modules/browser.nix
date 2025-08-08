{ config, pkgs, ... }:
{
  home-manager.sharedModules = [{
    programs.floorp = {
      enable = true;
      nativeMessagingHosts = with pkgs; [ keepassxc ];
    };
  }];
}
