{ config, ... }: {
  flake.modules.hjem.term = config.flake.modules.hjem.starship;
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
