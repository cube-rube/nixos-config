{
  flake.aspects.bat = {
    homeManager =
      {
        lib,
        pkgs,
        ...
      }:
      let
        inherit (lib) getExe;
      in
      {
        home.shellAliases = {
          cat = getExe pkgs.bat;
          man = getExe pkgs.bat-extras.batman;
          less = "${getExe pkgs.bat} --plain";
        };

        programs.bat = {
          enable = true;
          extraPackages = [ pkgs.bat-extras.batman ];

          config.theme = "base16";
        };
      };
  };
}
