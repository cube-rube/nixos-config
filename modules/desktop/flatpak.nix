{ config, ... }: {
  # TODO make declarative
  flake.modules.nixos.desktop = config.flake.modules.nixos.flatpak;
  flake.modules.nixos.flatpak = {
    services.flatpak.enable = true;
  };
}
