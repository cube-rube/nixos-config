{ pkgs, ... }:
{
  environment.variables.EDITOR = "hx";
  environment.systemPackages = [
    # make
    pkgs.autotools-language-server

    # python
    pkgs.ty
    pkgs.ruff

    # typst
    pkgs.tinymist

    # asm
    pkgs.asm-lsp

    # nix
    pkgs.nixd
    pkgs.alejandra
    pkgs.nixfmt-rfc-style
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
