{
  flake.modules.hjem.git =
    { pkgs, ... }:
    {
      packages = [
        pkgs.lazygit
        pkgs.mergiraf
      ];

      programs.git = {
        enable = true;
        package = pkgs.gitMinimal;

        integrations.difftastic.enable = true;

        settings = {
          user.name = "Cuberub";
          user.email = "111195474+cube-rube@users.noreply.github.com";

          init.defaultBranch = "main";
          merge.conflictStyle = "diff3";

          url."ssh://git@github.com/".insteadOf = "https://github.com/";
        };
      };
    };

  flake.modules.hjem.jujutsu =
    { pkgs, ... }:
    {
      xdg.config.files."jj/config.toml".generator = pkgs.writers.writeTOML "jj-config.toml";
      xdg.config.files."jj/config.toml".value = {
        user.name = "Cuberub";
        user.email = "111195474+cube-rube@users.noreply.github.com";
      };

      packages = [
        pkgs.jujutsu
      ];
    };
}
