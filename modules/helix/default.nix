{ pkgs, ... }:
{
  environment.variables.EDITOR = "hx";
  environment.systemPackages = with pkgs; [
    # make
    autotools-language-server

    # python
    ty
    ruff

    # typst
    tinymist

    # asm
    asm-lsp
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

      languages = import ./config.nix;
    };
  }];
}
