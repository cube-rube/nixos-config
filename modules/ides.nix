{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    jetbrains.pycharm-community
    python3
    uv
  ];
}
