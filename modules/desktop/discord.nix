{
  flake.modules.hjem.discord =
    {
      lib,
      pkgs,
      ...
    }:
    let
      inherit (lib.lists) singleton;
    in
    {
      packages = singleton pkgs.vesktop;
      xdg.config.files."vesktop/settings/settings.json".generator = lib.generators.toJSON { };
      xdg.config.files."vesktop/settings/settings.json".value = {
        plugins = {
          VolumeBooster.enabled = true;
          BetterGifPicker.enabled = true;
          Decor.enabled = true;
          FavouriteGifSearch.enabled = true;
          FakeNitro.enabled = true;
        };
      };
    };
}
