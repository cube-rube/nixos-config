{ config, lib, ... }:
let
  inherit (builtins) readDir;
  inherit (lib.attrsets) attrNames filterAttrs;
  inherit (lib.strings) hasSuffix removeSuffix;
  modules =
    ./core
    |> readDir
    |> filterAttrs (name: type: type == "regular" && hasSuffix ".nix" name)
    |> attrNames
    |> map (removeSuffix ".nix")
    |> map (name: config.flake.modules.nixos.${name});
in
{
  flake.modules.nixos.core = {
    imports = modules;
  };
}
