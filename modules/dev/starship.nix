{
  flake.aspects.starship = {
    homeManager = {
      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = {
          add_newline = true;
        };
      };
    };
  };
}
