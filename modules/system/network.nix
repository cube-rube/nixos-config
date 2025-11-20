{
  flake.aspects.network = {
    nixos = {
      networking.networkmanager.enable = true;
    };

    _.user = primaryUser: {
      nixos = {
        users.users.${primaryUser.short}.extraGroups = [ "networkmanager" ];
      };
    };
  };
}
