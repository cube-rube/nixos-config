{ pkgs, ...}: {
  environment.systemPackages = [
    pkgs.gh
    pkgs.git-filter-repo
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
          syntax-theme = "tokyo-night";


          # Tokyo night theme
          minus-style                   = "syntax \"#4a272f\" ";
          minus-non-emph-style          = "syntax \"#4a272f\" ";
          minus-emph-style              = "syntax \"#713137\" ";
          minus-empty-line-marker-style = "syntax \"#4a272f\" ";
          line-numbers-minus-style      = "\"#914c54\" ";
          plus-style                    = "syntax \"#243e4a\" ";
          plus-non-emph-style           = "syntax \"#243e4a\" ";
          plus-emph-style               = "syntax \"#2c5a66\" ";
          plus-empty-line-marker-style  = "syntax \"#243e4a\" ";
          line-numbers-plus-style       = "\"#449dab\" ";
          line-numbers-zero-style       = "\"#3b4261\" ";
        };
      };

      programs.lazygit = {
        enable = true;
        settings = {
          git.pagers = [
            { pager = "delta --dark --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\""; }
          ];
        };
      };
    })
  ];
}
