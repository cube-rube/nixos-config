{ pkgs, ...}: {
  environment.systemPackages = [
    pkgs.gh
    pkgs.git-filter-repo
    pkgs.git-agecrypt
  ];
  home-manager.sharedModules = [
    (homeArgs: let
      jjConfig = homeArgs.config.programs.jujutsu.settings;
    in {
      programs.git = {
        enable = true;
        settings = {
          inherit (jjConfig) user;
          init.defaultBranch = "main"; # maintaining the agenda is our top priority
          merge.conflictStyle = "zdiff3";
        };
      };

      programs.difftastic = {
        enable = true;
        git.enable = true;
      };

      programs.lazygit = {
        enable = true;
        enableBashIntegration = false;
        settings = {
          git.pagers = [
            { externalDiffCommand = "difft --color=always"; }
          ];
        };
      };
    })
  ];
}
