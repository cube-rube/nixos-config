{
  inputs,
  lib,
  config,
  ...
}:
let
  inherit (lib.options) mkOption;
  inherit (lib) types;
  inherit (lib.trivial) flip;
  inherit (lib.attrsets) mapAttrs;
in
{
  options.configurations = {
    nixos = mkOption {
      type = types.lazyAttrsOf (
        types.submodule {
          options.module = mkOption {
            type = types.deferredModule;
          };
        }
      );
    };
  };

  config.flake = {
    nixosConfigurations = flip mapAttrs config.configurations.nixos (
      _: { module }: inputs.nixpkgs.lib.nixosSystem { modules = [ module ]; }
    );
  };
}
