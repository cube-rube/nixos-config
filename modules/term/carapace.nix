{
  flake.modules.hjem.carapace =
    { pkgs, lib, ... }:
    let
      inherit (lib.meta) getExe;
    in
    {
      packages = [
        pkgs.carapace
        pkgs.carapace-bridge
        pkgs.inshellisense
        pkgs.zsh
        pkgs.fish
      ];

      environment.sessionVariables = {
        CARAPACE_BRIDGES = "inshellisense,carapace,zsh,fish,bash";
        CARAPACE_LENIENT = "1";
      };

      programs.nushell.extraConfig = /* nu */ ''
        source ${
          pkgs.runCommand "carapace.nu" { } /* bash */ ''
            ${getExe pkgs.carapace} _carapace nushell > $out
          ''
        }
      '';
    };
}
