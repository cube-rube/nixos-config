{
  perSystem =
    { pkgs, ... }:
    {
      packages.packweave = pkgs.callPackage (
        {
          lib,
          appimageTools,
          fetchurl,
        }:

        appimageTools.wrapType2 (finalAttrs: {
          pname = "packweave";
          version = "1.0.0";

          src = fetchurl {
            url = "https://github.com/packweavers/packweave/releases/download/v${finalAttrs.version}/packweave-linux-x86_64.AppImage";
            hash = "sha256-eATDsfTvmxslRzd0nsWmOsd3xV7SJsmetAU80xSmDk0=";
          };

          extraInstallCommands = /* sh */ ''
            install -D ${finalAttrs.contents}/packweave.desktop -t $out/share/applications/
            cp -r ${finalAttrs.contents}/usr/share/icons $out/share/
            install -D ${finalAttrs.contents}/packweave.png $out/share/pixmaps/packweave.png
          '';

          meta = {
            description = "A git-native desktop builder for Minecraft modpacks across Modrinth and CurseForge";
            homepage = "https://packweave.com/";
            mainProgram = "packweave";
            license = lib.licenses.gpl3Only;
            platforms = [ "x86_64-linux" ];
          };
        })
      ) { };
    };
}
