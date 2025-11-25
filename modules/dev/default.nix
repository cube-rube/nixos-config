{
  flake.aspects =
    { aspects, ... }:
    {
      dev = {
        includes = [
          aspects.shell
          aspects.shell._.bash

          aspects.git
        ];
      };
    };
}
