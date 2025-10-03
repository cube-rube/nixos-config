{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ firefox google-chrome ];
  home-manager.sharedModules = [{
    programs.floorp = {
      enable = true;
      nativeMessagingHosts = with pkgs; [ keepassxc ];
    };

    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };
  }];
}
