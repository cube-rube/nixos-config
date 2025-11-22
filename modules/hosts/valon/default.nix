{ config, ...}: {
  flake.aspects = { aspects, ... }: {
    "hosts/valon" = {
      includes = [
        aspects.system
        (aspects.system._.user [ "cuberub" ])
        aspects.dev
        # aspects.desktop
        aspects.printing

        aspects.cuberub
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
