{ lib, ... }: let
  inherit (lib) listToAttrs map nameValuePair;
in {
  flake.aspects.network = {
    nixos = {
      networking.networkmanager.enable = true;
    };

    _.user = users: {
      nixos = {
        users.users = users
          |> map (u: nameValuePair u { extraGroups = [ "networkmanager" ]; })
          |> listToAttrs;
      };
    };
  };
}
