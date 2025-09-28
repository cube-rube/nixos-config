{ lib, pkgs, ... }: let
  inherit (lib) readFile;
in {
  environment.shells = [
    pkgs.nushell
  ];

  programs.bash.interactiveShellInit = /* bash */ ''
      if ! [ "$TERM" = "dumb" ]; then
        exec nu
      fi
    '';
  home-manager.sharedModules = [{
    programs.nushell = {
      enable = true;
      configFile.text = readFile ./config.nu;
    };

    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
    };
  }];
}
