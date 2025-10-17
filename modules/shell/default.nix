{
  imports = [
    ./aliases.nix
    ./nushell.nix
    ./bat.nix
    ./eza.nix
    ./starship.nix
    ./carapace.nix
  ];

  home-manager.sharedModules = [{
    # bash is enabled by default in nixos, but home-manager doesn't know about that
    programs.bash.enable = true;
  }];
}
