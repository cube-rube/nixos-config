{
  flake.modules.nixos.kmscon =
    { pkgs, ... }:
    {
      services.kmscon = {
        enable = true;
        hwRender = true;
        useXkbConfig = true;
        config = {
          font-name = "JetBrainsMono Nerd Font Mono";
        };
      };
      fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
    };
}
