{
  flake.aspects.cuberub = {
    nixos = {
      users.users.cuberub = {
        description = "Cube Rub";
        isNormalUser = true;
        createHome = true;
        extraGroups = [
          "wheel"
          "plugdev"
          "dialout"
        ];
      };
      home-manager.users.cuberub = {
        home.stateVersion = "25.05";
      };
    };
  };
}
