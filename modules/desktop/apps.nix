{
  flake.aspects.desktop-apps = {
    nixos = { pkgs, ...}: {
      environment.systemPackages = [
        pkgs.krita
        pkgs.mpv
        pkgs.qbittorrent-enhanced
        pkgs.obsidian
        pkgs.spotify
        pkgs.kdePackages.kcalc
        pkgs.cables
        pkgs.libreoffice-fresh
      ];
    };
  };
}
