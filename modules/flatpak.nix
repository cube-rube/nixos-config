{
  # TODO make declarative
  flake.modules.nixos.flatpak = {
    services.flatpak.enable = true;
  };
}
