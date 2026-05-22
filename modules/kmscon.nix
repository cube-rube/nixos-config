{
  flake.modules.nixos.kmscon =
    { pkgs, ... }:
    {
      services.kmscon = {
        enable = true;
        hwRender = true;
        useXkbConfig = true;
        fonts = [
          {
            name = "Jetbrains Mono Nerd";
            package = pkgs.nerd-fonts.jetbrains-mono;
          }
        ];
      };
    };
}
