{
  flake.aspects.eza = {
    homeManager = {
      programs.eza = {
        enable = true;
        enableBashIntegration = true;
        icons = "always";
      };
    };
  };
}
