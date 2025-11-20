{
  flake.aspects = { aspects, ... }: {
    system = {
      includes = [ aspects.boot aspects.locale ];
    };
  };
}
