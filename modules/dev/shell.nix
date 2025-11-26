{
  flake.aspects = {
    shell = {
      _.bash = {
        homeManager = {
          programs.bash.enable = true;
        };
      };
      _.nushell = {

        nixos =
          { pkgs, ... }:
          {
            environment.shells = [
              pkgs.nushell
            ];
          };

        homeManager =
          { lib, ... }:
          let
            inherit (lib) readFile;
          in
          {
            programs.nushell = {
              enable = true;
              configFile.text = readFile ./config.nu;
              # extraConfig = /* nu */ ''
              #   $env.config.hooks.command_not_found = source ${pkgs.nix-index}/etc/profile.d/command-not-found.nu
              # '';
            };
          };

      };
    };
  };
}
