{ pkgs, ... }: {
  environment.shellAliases = {
    man = "batman";
  };
  home-manager.sharedModules = [{
    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batman ];

      themes = {
        tokyo-night = {
          src = pkgs.fetchFromGitHub {
            owner = "folke";
            repo = "tokyonight.nvim";
            rev = "054790b8676d0c561b22320d4b5ab3ef175f7445";
            sha256 = "mriZ9QBe1QIDsBkGd+tmg4bNFtD0evuSom2pWyQ1yEM=";
          };
          file = "extras/sublime/tokyonight_night.tmTheme";
        };
      };

      config = {
        theme = "tokyo-night";
      };
    };
  }];
}
