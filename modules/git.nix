{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lazygit
    gh
  ];
  home-manager.sharedModules = [
    (homeArgs: let
      homeConfig = homeArgs.config;
    in {
      programs.git = {
        enable = true;
        settings = homeConfig.programs.jujutsu.settings // {
          init.defaultBranch = "main"; # maintaining the agenda is our top priority
        };
      };
    })
  ];
}
