{ primaryUser }: { inputs, ...}: {
  flake.modules.nixos.nix = { pkgs, ... }: {
    nix.settings = (import <| inputs.self + /flake.nix).nixConfig;    
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 5 --keep-since 3d";
      flake = "/home/${primaryUser}/Config";
    };
  };
}
