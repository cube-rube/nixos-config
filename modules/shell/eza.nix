{
  home-manager.sharedModules = [{
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      icons = "always";
    };
  }];
}
