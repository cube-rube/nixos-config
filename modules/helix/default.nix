{ config, pkgs, ... }:
{
  environment.variables.EDITOR = "hx";
  environment.systemPackages = with pkgs; [
    autotools-language-server
    ty
    ruff
  ];

  home-manager.sharedModules = [{
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

      languages = {
        language-server = {
          autotools-language-server = {
            command = "autotools-language-server";
          };
          make-language-server = {
            command = "make-language-server";
          };
        };
        
        language = [
          {
            name = "make";
            auto-format = true;
            language-servers = [ "autotools-language-server" ];
          }
          {
            name = "c";
            indent = { tab-width = 4; unit = "    "; };
          }
        ];
      };
    };
  }];
}
