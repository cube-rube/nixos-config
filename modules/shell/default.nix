{
  imports = [
    ./nushell.nix
    ./bat.nix
    ./eza.nix
    ./starship.nix
  ];

  home-manager.sharedModules = [{
    # bash is enabled by default in nixos, but home-manager doesn't know about that
    programs.bash.enable = true;
  }];
}
