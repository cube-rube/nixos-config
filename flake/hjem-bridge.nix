{ config, lib, ... }:
let
  inherit (lib.attrsets) mapAttrs;
in
{
  flake.modules.nixos =
    config.flake.modules.hjem
    |> mapAttrs (
      _: hjemModule: {
        hjem.extraModules = [ hjemModule ];
      }
    );
}
