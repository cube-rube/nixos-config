{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ firefox google-chrome ];
  home-manager.sharedModules = [{
    programs.floorp = {
      enable = true;
      nativeMessagingHosts = with pkgs; [ keepassxc ];
    };
  }];
}
