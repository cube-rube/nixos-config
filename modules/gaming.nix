{
  flake.modules.nixos.gaming =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.prismlauncher
        pkgs.packwiz
        pkgs.ferium
        pkgs.r2modman
        pkgs.lumafly
        pkgs.itch
        pkgs.the-powder-toy
      ];
      programs.steam.enable = true;

      nixpkgs = {
        config.allowUnfree = true;
      };
    };
}
