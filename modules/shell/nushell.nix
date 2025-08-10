{
  home-manager.sharedModules = [{
    programs.nushell.enable = true;

    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
    };
  }];
}
