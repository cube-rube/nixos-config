{ pkgs, ... }:
{
  home-manager.sharedModules = [{
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        enkia.tokyo-night
      ];
    };
  }];
}
