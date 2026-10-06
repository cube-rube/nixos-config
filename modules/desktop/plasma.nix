{
  flake.modules.nixos.plasma =
    { pkgs, ... }:
    {
      services.displayManager.plasma-login-manager.enable = true;
      services.desktopManager.plasma6.enable = true;

      programs.kdeconnect.enable = true;

      environment.sessionVariables.LD_LIBRARY_PATH = [ "${pkgs.pipewire}/lib" ];
    };
}
