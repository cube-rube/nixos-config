{
  flake.modules.nixos.kmscon =
    { pkgs, ... }:
    {
      services.kmscon = {
        enable = true;
        useXkbConfig = true;
        config = {
          font-name = "JetBrainsMono Nerd Font Mono";
          hwaccel = true;
        };
      };
      fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
    };
}
