{
  flake.modules.nixos.git = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.gh
      pkgs.git-filter-repo
      pkgs.git-agecrypt
      pkgs.git-crypt
    ];
  };
  
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings = {
        user.name = "Cube Rub";
        user.email = "111195474+cube-rube@users.noreply.github.com";
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
  };
}
