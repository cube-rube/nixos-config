{
  flake.aspects.core.nixos =
    { pkgs, ... }:
    {
      documentation = {
        info.enable = false;
        doc.enable = false;
        dev.enable = true;
        man.enable = true;
      };

      environment.systemPackages = [
        pkgs.man-pages
        pkgs.man-pages-posix
      ];
    };
}
