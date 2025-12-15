{ config, ... }:
{
  # flake.aspects =
  #   { aspects, ... }:
  #   {
  #     "hosts/valon" = {
  #       includes = [
  #         aspects.base
  #         aspects.desktop
  #         aspects.dev
  #         aspects.nvidia
  #         aspects.printing
  #         aspects.gaming
  #         aspects.zapret
  #         aspects.wireguard

  #         aspects.cuberub
  #       ];
  #       nixos = {
  #         imports = [
  #           ./_hw-config.nix
  #         ];

  #         networking.hostName = "valon";
  #         system.stateVersion = "25.05";
  #       };
  #       homeManager = { };
  #     };
  #   };
  #
  configurations.nixos.valon.module = {
    imports = with config.flake.modules.nixos; [
      base
      desktop
      dev
      nvidia
      printing
      gaming
      zapret
      wireguard

      cuberub
      ./_hw-config.nix
    ];
  
    
  };
}
