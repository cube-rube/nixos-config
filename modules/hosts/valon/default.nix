{
  flake.aspects = { aspects, ... }: {
    "hosts/valon" = {
      includes = [
        aspects.boot
      ];
      nixos = {
        imports = [
          ./_hw-config.nix 
        ];
        system.stateVersion =  "25.11";
      };
    };
  };
}
