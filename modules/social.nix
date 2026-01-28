{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.ayugram-desktop
    pkgs.element-desktop
  ];
  home-manager.sharedModules = [
    {
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
    }
  ];
}
