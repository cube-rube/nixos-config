{
  flake.aspects.xdg = {
    homeManager =
      { config, ... }:
      {
        xdg = {
          enable = true;
          userDirs.extraConfig = {
            XDG_DEVELOPMENT_DIR = "${config.home.homeDirectory}/Development";
          };
        };
      };
  };
}
