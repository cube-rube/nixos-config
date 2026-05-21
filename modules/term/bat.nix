{
  # ???????????
  flake.modules.nixos.batman =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.bat
        pkgs.bat-extras.batman
      ];
      environment.shellAliases.man = "batman";
    };
  flake.modules.hjem.batman =
    { pkgs, ... }:
    {
      packages = [
        pkgs.bat
        pkgs.bat-extras.batman
      ];

      programs.nushell.aliases.man = "batman";
    };
}
