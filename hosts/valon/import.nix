{ config, inputs, ... }:
{
  flake.nixosConfigurations.valon = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [
      core
      desktop
      ./_hw-config.nix
    ];
  };
}
