{ config, inputs, ... }: {
  flake.modules.nixos.network = config.flake.modules.nixos.zapret;
  flake.modules.nixos.zapret = {
    imports = [ inputs.zapret.nixosModules.default ];
    services.zapret-discord-youtube = {
      enable = true;
      configName = "general (ALT12)";
    };
  };
}
