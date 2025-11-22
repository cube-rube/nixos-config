{
  flake.aspects = { aspects, ... }: {
    shell = {
      _.bash = {
        homeManager = {
          programs.bash.enable = true;
        };
      };
    };
  };
}
