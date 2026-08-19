{ self, ... }: {
  flake.modules.nixos.gaming =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.packweave
        pkgs.prismlauncher
        pkgs.packwiz
        pkgs.ferium
        pkgs.r2modman
        pkgs.lumafly
        pkgs.itch
        pkgs.the-powder-toy
      ];
      programs.steam.enable = true;
      programs.steam.extraCompatPackages = [
        pkgs.proton-ge-bin
      ];

      nixpkgs = {
        config.allowUnfree = true;
      };
    };
}
