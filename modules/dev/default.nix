{
  flake.aspects =
    { aspects, ... }:
    {
      dev = {
        includes = [
          aspects.shell
          aspects.shell._.bash

          aspects.git
          aspects.bat
          aspects.cli
        ];
      };
    };
}
