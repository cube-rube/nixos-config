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
        userName  = homeConfig.programs.jujutsu.settings.user.name;
        userEmail = homeConfig.programs.jujutsu.settings.user.email;
        extraConfig = {
          init.defaultBranch = "main"; # maintaining the agenda is our top priority
        };
      };
    })
  ];
}
