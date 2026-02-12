{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.jetbrains.pycharm-oss
  ];
}
