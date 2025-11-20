{ config, ... }: {
  flake.aspects.cuberub = rec {
    meta = {
      short = "cuberub";
      name = "Cube Rub";
    };
    
    nixos = {
      users.users.cuberub = {
        description = meta.name;
        isNormalUser = true;
        createHome = true;
        extraGroups = [
          "wheel"
          "plugdev"
          "dialout"
        ];
      }; 
    };
  };
}
