{
  flake.aspects =
    { aspects, ... }:
    {
      desktop = {
        nixos = {
          # keyboard
          services.xserver.xkb = {
            layout = "us,ru";
            options = "grp:win_space_toggle";
          };
          # audio
          services.pulseaudio.enable = false;
          security.rtkit.enable = true;
          services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
          };
        };
        includes = [
          aspects.plasma
          aspects.desktop-apps
        ];
      };
    };
}
