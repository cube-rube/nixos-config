{
  config,
  inputs,
  ...
}:
let
  flakeModules = config.flake.modules;
in
{
  flake.nixosConfigurations.valon = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      flakeModules.nixos.workstation
      {
        imports = [
          ./_hw-config.nix
        ];
        networking.hostName = "valon";

        boot.zswap.enable = true;
        boot.kernel.sysctl."vm.swappiness" = 100;

        environment.sessionVariables = {
          KWIN_SCREENCAST_NO_DMABUF = "1";
        };

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
      }
    ];
  };
}
