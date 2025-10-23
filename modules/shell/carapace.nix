{ pkgs, ... }: {

  environment.systemPackages = [
    pkgs.fish
    pkgs.zsh
    pkgs.inshellisense
  ];

  environment.sessionVariables.CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense";
  
  home-manager.sharedModules = [{
    programs.carapace = {
      enable = true;
      enableBashIntegration = true;
    };
  }];
}
