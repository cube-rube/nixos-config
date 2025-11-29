{
  flake.aspects =
    { aspects, ... }:
    {
      dev = {
        includes = [
          aspects.shell
          aspects.shell._.bash
          aspects.shell._.nushell

          aspects.embedded-dev
          aspects.git
          aspects.cli
          aspects.jj

          aspects.aliases
          aspects.bat
          aspects.carapace
          aspects.direnv
          aspects.eza
          aspects.starship
          aspects.zoxide
        ];
      };
    };
}
