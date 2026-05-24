{ inputs, ... }:
{
  flake.modules.nixos.home =
    { lib, ... }:
    let
      inherit (lib.lists) singleton;
    in
    {
      imports = [
        inputs.hjem.nixosModules.hjem
      ];

      hjem.extraModules = singleton inputs.hjem-rum.hjemModules.hjem-rum;
      hjem.clobberByDefault = true;

      hjem.users.root = { };
    };

  flake.modules.hjem.home =
    { lib, ... }:
    let
      inherit (lib.lists) singleton;
      inherit (lib.modules) mkAliasOptionModule;
    in
    {
      imports = singleton <| mkAliasOptionModule [ "programs" ] [ "rum" "programs" ];
    };
}
