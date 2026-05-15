{ inputs, ... }:
{
  flake.modules.nixos.home =
    { lib, ... }:
    let
      inherit (lib.lists) singleton;
      inherit (lib.modules) mkAliasOptionModule;
    in
    {
      imports = [
        inputs.hjem.nixosModules.hjem
        (mkAliasOptionModule [ "home" ] [ "hjem" ])
      ];

      home.extraModules = singleton inputs.hjem-rum.hjemModules.hjem-rum;
      home.clobberByDefault = true;
    };

  flake.modules.home.home =
    { lib, ... }:
    let
      inherit (lib.lists) singleton;
      inherit (lib.modules) mkAliasOptionModule;
    in
    {
      imports = singleton <| mkAliasOptionModule [ "programs" ] [ "rum" "programs" ];
    };
}
