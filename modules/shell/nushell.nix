{ lib, pkgs, ... }: let
  inherit (lib) readFile;
in {
  environment.shells = [
    pkgs.nushell
  ];

  # environment.systemPackages = [
  #   pkgs.fish
  #   pkgs.zsh
  #   pkgs.inshellisense
  # ];

  # programs.bash.interactiveShellInit = /* bash */ ''
  #     if ! [ "$TERM" = "dumb" ]; then
  #       exec nu
  #     fi
  #   '';

  home-manager.sharedModules = [{
    programs.nushell = {
      enable = true;
      configFile.text = readFile ./config.nu;
      extraConfig = /* nu */ ''
          $env.config.hooks.command_not_found = source ${pkgs.nix-index}/etc/profile.d/command-not-found.nu
        '';
    };

    # programs.carapace = {
    #   enable = true;
    #   enableNushellIntegration = true;
    # };
  }];
}
