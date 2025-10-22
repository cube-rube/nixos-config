{
  programs.zsh.enable = true;

  home-manager.sharedModules = [{
    programs.zsh = {
      enable = true;
    };
  }];
}
