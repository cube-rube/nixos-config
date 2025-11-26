{
  flake.aspects.jj = {
    homeManager = {
      programs.jujutsu = {
        enable = true;
        settings = {
          user.name = "Cub Rub";
          user.email = "111195474+cube-rube@users.noreply.github.com";
        };
      };
    };
  };
}
