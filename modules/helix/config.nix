{
  language-server = {
    autotools-language-server = {
      command = "autotools-language-server";
    };
    make-language-server = {
      command = "make-language-server";
    };
    flix-lsp = {
      command = "flix";
      args = [ "lsp" ];
    };
  };
  
  language = [
    {
      name = "make";
      auto-format = true;
      language-servers = [ "autotools-language-server" ];
    }
    # {
    #   name = "c";
    #   indent = { tab-width = 4; unit = "    "; };
    # }
    {
      name = "nix";
      auto-format = false;
      formatter.command = "nixfmt";
    }
    {
      name = "fasm";
      scope = "source.fasm";
      file-types = ["fasm"];
      comment-tokens = ";";
      indent = { tab-width = 8; unit = "        "; };
    }
    {
      name = "flix";
      scope = "source.flix";
      file-types = [ "flix" ];
      comment-tokens = [ "//" "///" ];
      indent = { tab-width = 4; unit = "    "; };
      language-servers = [ "flix-lsp" ];
    }
  ];
  grammar = [
    {
      name = "fasm";
      source = { git = "https://github.com/RubixDev/tree-sitter-asm"; rev = "04962e15f6b464cf1d75eada59506dc25090e186"; };
    }
  ];
}
