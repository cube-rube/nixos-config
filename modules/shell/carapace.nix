{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    fish
    zsh
    inshellisense
  ];

  environment.sessionVariables.CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense";
  
  home-manager.sharedModules = [{
    programs.carapace = {
      enable = true;
      enableBashIntegration = true;
    };
  }];
}
