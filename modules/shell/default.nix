{
  imports = [
    ./nushell.nix
    ./bat.nix
    ./eza.nix
    ./starship.nix
  ];

  home-manager.sharedModules = [{
    programs.bash.enable = true;
  }];
}
