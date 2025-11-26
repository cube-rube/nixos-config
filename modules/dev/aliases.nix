{
  flake.aspects.aliases = {
    nixos = {
      environment.shellAliases = {
        lg = "lazygit";
      };
    };
  };
}
