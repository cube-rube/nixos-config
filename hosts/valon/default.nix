{
  config,
  lib,
  inputs,
  ...
}:
let
  inherit (lib.attrsets) attrValues;
  inherit (lib.lists) singleton;
in
{
  flake.nixosConfigurations.valon = inputs.nixpkgs.lib.nixosSystem {
    modules =
      attrValues config.flake.modules.nixos
      ++ singleton {
        hjem.extraModules = attrValues config.flake.modules.hjem;
      }
      ++ singleton {
        imports = singleton ./_hw-config.nix;
        networking.hostName = "valon";

        hardware.facter = {
          enable = true;
          reportPath = ./facter.json;
        };

        users.users.cuberub = {
          isNormalUser = true;
          description = "cuberub";
          extraGroups = [
            "wheel"

            # embedded
            "plugdev"
            "dialout"
          ];
        };
        users.groups.plugdev.members = [ "cuberub" ];
        hjem.users.cuberub = { };

        nixpkgs.hostPlatform = "x86_64-linux";
        system.stateVersion = "25.05";
      };

  };
}
