{
  flake.aspects = { aspects, ... }: {
    "hosts/valon" = {
      includes = [
        aspects.boot
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
