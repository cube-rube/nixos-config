{
  flake.aspects.core = {
    homeManager =
      { config, ... }:
      {
        xdg = {
          enable = true;
          userDirs.extraConfig = {
            XDG_DEVELOPMENT_DIR = "${config.home.homeDirectory}/Development";
          };
        };

        home.sessionVariables = {
          CARGO_HOME = "${config.xdg.dataHome}/cargo";
          CUDA_CACHE_PATH = "${config.xdg.cacheHome}/nv";
          DOTNET_CLI_HOME = "${config.xdg.dataHome}/dotnet";
          GTK2_RC_FILES = "${config.xdg.configHome}/gtk-2.0/gtkrc";

          NPM_CONFIG_INIT_MODULE = "${config.xdg.configHome}/npm/config/npm-init.js";
          NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
          NPM_CONFIG_TMP = "$XDG_RUNTIME_DIR/npm/config/npm-init.js";
        };
      };
  };
}
