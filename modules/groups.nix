{ config, ... }:

let
  nixos = config.flake.modules.nixos;
in
{
  flake.modules.nixos.hardware = {
    imports = [
      nixos.audio
      nixos.nvidia
      nixos.printing
    ];
  };

  flake.modules.nixos.workstation = {
    imports = [
      nixos.core
      nixos.desktop
      nixos.network
      nixos.term
      nixos.hardware

      nixos.home
      nixos.gaming
      nixos.kmscon
      nixos.probe-rs
      nixos.ssh-client
      nixos.ssh-server
      nixos.syncthing
    ];
  };
}
