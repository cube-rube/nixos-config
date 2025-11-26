{
  flake.aspects.carapace = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.fish
          pkgs.zsh
          pkgs.inshellisense
        ];

        environment.sessionVariables.CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense";
      };

    homeManager = {
      programs.carapace = {
        enable = true;
        enableBashIntegration = true;
      };
    };
  };
}
