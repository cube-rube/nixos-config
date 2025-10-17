{ pkgs, ...}: {
  environment.systemPackages = [ pkgs.zoxide ];
  home-manager.sharedModules = [{
      programs.zoxide.enable = true;
  }];
}
