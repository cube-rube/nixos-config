{
  flake.aspects.zoxide = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.zoxide ];
      };
    homeManager = {
      programs.zoxide.enable = true;
    };
  };
}
