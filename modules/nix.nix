{ inputs, ... }: {
  flake.aspects.nix = {
    nixos = {
      nix.settings = (import <| inputs.self + /flake.nix).nixConfig // {
        use-xdg-base-directories = true;
      };    
      programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep 5 --keep-since 3d";
      };
    };
    _.user = primaryUser: {
      nixos.programs.nh.flake = "/home/${primaryUser}/Config";
    };
  };
}
