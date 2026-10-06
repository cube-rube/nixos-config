{ config, ... }: {
  flake.modules.hjem.term = config.flake.modules.hjem.direnv;
  flake.modules.hjem.direnv = {
    programs.direnv = {
      enable = true;
      integrations.nushell.enable = true;
      integrations.nix-direnv.enable = true;
      settings = {
        global = {
          strict_env = true;
          warn_timeout = 0;
        };
      };
    };
  };
}
