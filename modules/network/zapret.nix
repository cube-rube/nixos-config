{ inputs, ... }:
{
  flake.modules.nixos.zapret = {
    imports = [ inputs.zapret.nixosModules.default ];
    services.zapret-discord-youtube = {
      enable = true;
      configName = "general (FAKE_TLS_AUTO_ALT2)";
    };
  };
}
