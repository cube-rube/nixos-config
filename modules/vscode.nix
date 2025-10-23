{ pkgs, ... }:
{
  home-manager.sharedModules = [{
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default.extensions = [
        pkgs.vscode-extensions.enkia.tokyo-night
      ];
    };
  }];
}
