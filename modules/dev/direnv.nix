{
  flake.aspects.direnv = {
    homeManager = {
      programs.direnv = {
        enable = true;
        enableBashIntegration = true;
        config = {
          global = {
            strict_env = true;
            warn_timeout = 0;
          };
        };
        nix-direnv.enable = true;
      };
    };
  };
}
