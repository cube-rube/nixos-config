{
  home-manager.users.cuberub.services.syncthing = {
    enable = true;
    settings = {
      options.urAccepted = -1;
      devices = import ./devices.sct.nix;
      folders = import ./folders.sct.nix;
    };
    overrideFolders = true;
    overrideDevices = true;
  };
}
