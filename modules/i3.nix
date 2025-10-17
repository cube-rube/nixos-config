{
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    displayManager.startx.enable = true;
  };

  security.pam.services = {
    i3lock.enable = true;
    i3lock-color.enable = true;
    xlock.enable = true;
    xscreensaver.enable = true;
  };

  home-manager.sharedModules = [
    {
      xsession.windowManager.i3 = {
        enable = true;
      };
    }
  ];
}
