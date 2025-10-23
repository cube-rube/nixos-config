{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.jetbrains.pycharm-community
  ];
}
