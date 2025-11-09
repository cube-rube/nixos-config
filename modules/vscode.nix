{ pkgs, ... }:
{
  home-manager.sharedModules = [{
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      profiles.default.extensions = [
        pkgs.vscode-extensions.enkia.tokyo-night
      ];
    };
  }];
}
