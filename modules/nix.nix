{ inputs, ... }:
{
  flake.aspects.nix = {
    nixos = {
      nix.settings = (import <| inputs.self + /flake.nix).nixConfig // {
        use-xdg-base-directories = true;
      };

      nix.optimise.automatic = true;

      programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep 5 --keep-since 3d";
        clean.dates = "weekly";
      };
    };
  };
}
