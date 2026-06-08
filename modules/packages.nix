{
  flake.modules.hjem.packages-shell-utils =
    { pkgs, ... }:
    {
      packages = [
        pkgs.asciinema
        pkgs.cowsay
        pkgs.lolcat
        pkgs.terminaltexteffects
        pkgs.fastfetch

        pkgs.unrar

        pkgs.pciutils
        pkgs.usbutils
        pkgs.fd
        pkgs.ripgrep
        pkgs.jc
        pkgs.dust
        pkgs.htop
        pkgs.tree
        pkgs.tokei
        pkgs.uutils-coreutils-noprefix
        pkgs.yazi

        pkgs.dex

        pkgs.just

        pkgs.fasm
      ];
    };

  flake.modules.hjem.packages-debug =
    { pkgs, ... }:
    {
      packages = [
        pkgs.gdb
        pkgs.lldb
        pkgs.rr
      ];
    };

  flake.modules.nixos.packages-cc =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.gcc
        pkgs.clang
        pkgs.clang-tools
        pkgs.gnumake
      ];
    };

  flake.modules.hjem.packages-python =
    { config, pkgs, ... }:
    let
      package = pkgs.python3;
    in
    {
      environment.sessionVariables = {
        UV_PYTHON_PREFERENCE = "system";
        UV_PYTHON = "${package}";
        PYTHON_HISTORY = "${config.xdg.state.directory}/python/history";
      };
      xdg.state.files."python".type = "directory";
      packages = [
        package
        pkgs.uv
      ];
    };

  flake.modules.hjem.packages-rust =
    { config, pkgs, ... }:
    {
      environment.sessionVariables = {
        CARGO_HOME = "${config.xdg.data.directory}/cargo";
      };
      xdg.data.files."cargo".type = "directory";

      packages = [
        pkgs.cargo
        pkgs.cargo-expand
        pkgs.cargo-deny
        pkgs.clippy
        pkgs.rustfmt
        pkgs.rust-analyzer
        pkgs.rustc
      ];
    };
}
