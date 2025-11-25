{
  flake.aspects.network = {
    nixos =
    { config, lib, ...}:
    let
      inherit (lib) filterAttrs const getAttr attrNames;
    in
    {
      networking.networkmanager.enable = true;
      users.extraGroups.networkmanager.members = config.users.users
        |> filterAttrs (const <| getAttr "isNormalUser")
        |> attrNames;
    };
  };
}
