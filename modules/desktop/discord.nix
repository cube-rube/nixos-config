{
  flake.aspects.desktop = {
    homeManager = {
      programs.vesktop = {
        enable = true;
        vencord.settings = {
          plugins = {
            VolumeBooster.enabled = true;
            BetterGifPicker.enabled = true;
            Decor.enabled = true;
            FavouriteGifSearch.enabled = true;
            FakeNitro.enabled = true;
          };
        };
      };
    };
  };
}
