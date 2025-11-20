{
  flake.aspects = { aspects, ... }: {
    "hosts/valon" = {
      includes = [
        aspects.system
        # aspects.desktop
        aspects.printing
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
