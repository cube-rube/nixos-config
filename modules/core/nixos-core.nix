{ inputs, ... }:
{
  flake.modules.nixos.nixos-core =
    { lib, ... }:
    let
      inherit (lib.lists) singleton;
    in
    {
      imports = singleton inputs.nixos-core.nixosModules.default;

      # system.nixos-core.enable = true;
    };
}
