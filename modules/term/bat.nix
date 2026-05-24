{
  flake.modules.hjem.batman =
    { lib, pkgs, ... }:
    let
      inherit (lib.meta) getExe;
    in
    {
      packages = [
        pkgs.bat
        pkgs.bat-extras.batman
      ];

      xdg.config.files."bat/config".text = ''
        --theme=base16
      '';

      programs.nushell.aliases = {
        man = getExe pkgs.bat-extras.batman;
        cat = getExe pkgs.bat;
      };
    };
}
