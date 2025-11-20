{ config, ...}: {
  flake.aspects = { aspects, ... }: {
    "hosts/valon" = rec {
      meta = {
        primaryUser = config.flake.meta.cuberub;
      };
      includes = [
        aspects.system
        # aspects.desktop
        aspects.printing
        aspects.network
        (aspects.network._.user meta.primaryUser)
      ];
      nixos = {
        imports = [
          ./_config.nix
          ./_hw-config.nix 
        ];
      };
    };
  };
}
