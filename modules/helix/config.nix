{
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
}
