{
  flake.modules.hjem.dev = {
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
