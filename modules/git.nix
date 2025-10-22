{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lazygit
    gh
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

      programs.delta = {
        enable = true;
        enableGitIntegration = true;
        options = {
          navigate = true;
          hyperlinks = true;
        };
      };

    })
  ];
}
