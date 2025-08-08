{ config, pkgs, ... }:
{
  environment.variables.EDITOR = "hx";

  home-manager.sharedModules = [
    {

      programs.helix = {
        enable = true;
        settings = {
          theme = "tokyonight";
          editor = {
            bufferline = "multiple";
            color-modes = true;
            line-number = "relative";
            cursorline = true;
          };
        };

        settings.editor.cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    }
  ];
}
