{
  inputs,
  lib,
  config,
  ...
}:
let
  inherit (lib)
    filterAttrs
    hasPrefix
    mapAttrs'
    nameValuePair
    removePrefix
    ;
  prefix = "hosts/";
in
{
  flake.nixosConfigurations =
    config.flake.modules.nixos
    |> filterAttrs (name: _: hasPrefix prefix name)
    |> mapAttrs' (
      name: module:
      nameValuePair (removePrefix prefix name) (
        inputs.nixpkgs.lib.nixosSystem {
          modules = [ module ] ++ [ ];
        }
      )
    );
}
