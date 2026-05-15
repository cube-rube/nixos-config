{
  flake.modules.hjem.discord =
    {
      lib,
      pkgs,
      ...
    }:
    let
      inherit (lib.lists) singleton;
      inherit (lib.generators) toJSON;
    in
    {
      packages = singleton pkgs.vesktop;
      xdg.config.files."vesktop/settings/settings.json" = {
        generator = toJSON {
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
}
