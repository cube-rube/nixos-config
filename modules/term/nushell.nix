{
  flake.modules.nixos.nushell =
    { lib, pkgs, ... }:
    let
      inherit (lib.meta) getExe;
    in
    {
      environment.shells = map getExe [
        pkgs.nushell
        pkgs.dash
      ];

      users.defaultUserShell = pkgs.dash;
      environment.sessionVariables.ENV = pkgs.writeShellScript "dashInit" /* sh */ ''
        if ! [ "$TERM" = "dumb" ]; then
          exec ${getExe pkgs.nushell}
        fi
      '';
    };

  flake.modules.hjem.nushell =
    { lib, ... }:
    let
      inherit (lib.strings) readFile;
    in
    {
      programs.nushell = {
        enable = true;

        extraConfig = readFile ./config.nu;

        aliases = {
          la = "ls -a";
          ll = "ls -l";
          lla = "ls -la";
        };
      };
    };
}
