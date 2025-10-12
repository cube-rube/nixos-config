# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./boot.nix
      ./kernel.nix
      ./nvidia.nix
      ./syncthing.nix
      ./wireguard.nix
      ./printing.nix

      ../../modules/network.nix
      ../../modules/social.nix
      ../../modules/keepass.nix
      ../../modules/browser.nix
      ../../modules/games.nix
      ../../modules/packages.nix
      ../../modules/flatpak.nix
      ../../modules/wine.nix
      ../../modules/fhs.nix
      ../../modules/nix.nix
      ../../modules/ghostty.nix
      ../../modules/helix
      ../../modules/vscode.nix
      ../../modules/ssh.nix
      ../../modules/shell
      ../../modules/manpages.nix
      ../../modules/office.nix
      ../../modules/ides.nix
    ];

  networking.hostName = "nixrock"; # Define your hostname.

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cuberub = {
    isNormalUser = true;
    description = "cuberub";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}
