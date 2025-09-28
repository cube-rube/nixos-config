{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ ayugram-desktop ];
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
