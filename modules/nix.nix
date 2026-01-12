{ self, pkgs, ... }: {
  nix.package = pkgs.lixPackageSets.stable.lix;

  nix.settings = (import <| self + /flake.nix).nixConfig;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/cuberub/Config";
  };
}
