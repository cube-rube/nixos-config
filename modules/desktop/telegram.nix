{
  flake.modules.nixos.telegram =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.ayugram-desktop ];
    };
}
