{ inputs, ... }:
{
  flake.modules.nixos.nix =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.npins
      ];

      # nix.package = pkgs.lixPackageSets.stable.lix;

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
}
