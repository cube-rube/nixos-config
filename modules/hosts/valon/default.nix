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
            ./_hw-config.nix
          ];

          networking.hostname = "valon";
          system.stateVersion = "25.05";
        };
      };
    };
}
