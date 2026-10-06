{ config, ... }: {
  flake.modules.nixos.network = config.flake.modules.nixos.amnezia;
  flake.modules.nixos.amnezia = {
    programs.amnezia-vpn.enable = true;
  };
}
