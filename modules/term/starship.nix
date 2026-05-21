{
  flake.modules.hjem.starship = {
    programs.starship = {
      enable = true;
      integrations.nushell.enable = true;
      settings = {
        add_newline = true;
      };
    };
  };
}
