{
  flake.modules.nixos.cli = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.asciinema
      pkgs.cowsay
      pkgs.lolcat
      pkgs.terminaltexteffects
      pkgs.fastfetch

      pkgs.tokei
      pkgs.yazi
      pkgs.bc
   
      pkgs.pciutils
      pkgs.usbutils
      pkgs.fd
      pkgs.ripgrep
      pkgs.dust
      pkgs.just
    ];
  };
}
