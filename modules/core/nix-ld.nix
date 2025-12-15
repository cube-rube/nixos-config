{
  flake.aspects.core = {
    nixos =
      { pkgs, ... }:
      {
        programs.nix-ld.enable = true;
        programs.nix-ld.libraries = [
          # List by default
          pkgs.zlib
          pkgs.zstd
          pkgs.stdenv.cc.cc
          pkgs.stdenv.cc.cc.lib
          pkgs.curl
          pkgs.openssl
          pkgs.attr
          pkgs.libssh
          pkgs.bzip2
          pkgs.libxml2
          pkgs.acl
          pkgs.libsodium
          pkgs.util-linux
          pkgs.xz
          pkgs.systemd

          # My own additions
          pkgs.xorg.libXcomposite
          pkgs.xorg.libXtst
          pkgs.xorg.libXrandr
          pkgs.xorg.libXext
          pkgs.xorg.libX11
          pkgs.xorg.libXfixes
          pkgs.libGL
          pkgs.libva
          pkgs.pipewire
          pkgs.xorg.libxcb
          pkgs.xorg.libXdamage
          pkgs.xorg.libxshmfence
          pkgs.xorg.libXxf86vm
          pkgs.libelf

          # Required
          pkgs.glib
          pkgs.gtk2

          # Inspired by steam
          # https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/st/steam/package.nix#L36-L85
          pkgs.networkmanager
          pkgs.vulkan-loader
          pkgs.libgbm
          pkgs.libdrm
          pkgs.libxcrypt
          pkgs.coreutils
          pkgs.pciutils
          pkgs.zenity
          # glibc_multi.bin # Seems to cause issue in ARM

          # Without these it silently fails
          pkgs.xorg.libXinerama
          pkgs.xorg.libXcursor
          pkgs.xorg.libXrender
          pkgs.xorg.libXScrnSaver
          pkgs.xorg.libXi
          pkgs.xorg.libSM
          pkgs.xorg.libICE
          pkgs.gnome2.GConf
          pkgs.nspr
          pkgs.nss
          pkgs.cups
          pkgs.libcap
          pkgs.SDL2
          pkgs.libusb1
          pkgs.dbus-glib
          pkgs.ffmpeg
          # Only libraries are needed from those two
          pkgs.libudev0-shim

          # needed to run unity
          pkgs.gtk3
          pkgs.icu
          pkgs.libnotify
          pkgs.gsettings-desktop-schemas
          # https://github.com/NixOS/nixpkgs/issues/72282
          # https://github.com/NixOS/nixpkgs/blob/2e87260fafdd3d18aa1719246fd704b35e55b0f2/pkgs/applications/misc/joplin-desktop/default.nix#L16
          # log in /home/leo/.config/unity3d/Editor.log
          # it will segfault when opening files if you don’t do:
          # export XDG_DATA_DIRS=/nix/store/0nfsywbk0qml4faa7sk3sdfmbd85b7ra-gsettings-desktop-schemas-43.0/share/gsettings-schemas/gsettings-desktop-schemas-43.0:/nix/store/rkscn1raa3x850zq7jp9q3j5ghcf6zi2-gtk+3-3.24.35/share/gsettings-schemas/gtk+3-3.24.35/:$XDG_DATA_DIRS
          # other issue: (Unity:377230): GLib-GIO-CRITICAL **: 21:09:04.706: g_dbus_proxy_call_sync_internal: assertion 'G_IS_DBUS_PROXY (proxy)' failed

          # Verified games requirements
          pkgs.xorg.libXt
          pkgs.xorg.libXmu
          pkgs.libogg
          pkgs.libvorbis
          pkgs.SDL
          pkgs.SDL2_image
          pkgs.glew110
          pkgs.libidn
          pkgs.tbb

          # Other things from runtime
          pkgs.flac
          pkgs.freeglut
          pkgs.libjpeg
          pkgs.libpng
          pkgs.libpng12
          pkgs.libsamplerate
          pkgs.libmikmod
          pkgs.libtheora
          pkgs.libtiff
          pkgs.pixman
          pkgs.speex
          pkgs.SDL_image
          pkgs.SDL_ttf
          pkgs.SDL_mixer
          pkgs.SDL2_ttf
          pkgs.SDL2_mixer
          pkgs.libappindicator-gtk2
          pkgs.libdbusmenu-gtk2
          pkgs.libindicator-gtk2
          pkgs.libcaca
          pkgs.libcanberra
          pkgs.libgcrypt
          pkgs.libvpx
          pkgs.librsvg
          pkgs.xorg.libXft
          pkgs.libvdpau
          # ...
          # Some more libraries that I needed to run programs
          pkgs.pango
          pkgs.cairo
          pkgs.atk
          pkgs.gdk-pixbuf
          pkgs.fontconfig
          pkgs.freetype
          pkgs.dbus
          pkgs.alsa-lib
          pkgs.expat
          # for blender
          pkgs.libxkbcommon

          pkgs.libxcrypt-legacy # For natron
          pkgs.libGLU # For natron

          # Appimages need fuse, e.g. https://musescore.org/fr/download/musescore-x86_64.AppImage
          pkgs.fuse
          pkgs.e2fsprogs
        ];
      };
  };
}
