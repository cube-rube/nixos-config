{
  flake.aspects =
    { aspects, ... }:
    {
      "hosts/valon" = {
        includes = [
          aspects.system
          aspects.dev
          # aspects.desktop
          # aspects.nvidia
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
