{
  flake.aspects."hosts/valon" = {
    nixos = {
      system.stateVersion =  "25.11";
    };
  };
}
