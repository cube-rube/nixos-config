{
  flake.modules.nixos.nushell =
    { pkgs, ... }:
    {
      environment.shells = [
        pkgs.nushell
      ];
    };

  flake.modules.hjem.nushell =
    { lib, ... }:
    let
      inherit (lib.strings) readFile;
    in
    {
      programs.nushell = {
        enable = true;

        config = readFile ./config.nu;

        aliases = {
          la = "ls -a";
          ll = "ls -l";
          lla = "ls -la";
        };
      };
    };
}
