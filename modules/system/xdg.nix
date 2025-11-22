{
  flake.aspects.xdg = {
    homeManager = { config, ... }: {
      xdg = {
        enable = true;
        extraConfig = {
          XDG_DEVELOPMENT_DIR = "${config.home.homeDirectory}/Development";
        };
      };
    };
  };
}
