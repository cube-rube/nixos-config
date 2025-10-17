{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    fish
    zsh
    inshellisense
  ];
  
  home-manager.sharedModules = [{
    programs.carapace.enable = true;
  }];
}
