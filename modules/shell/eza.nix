{ config, pkgs, ... }: {
  environment.shellAliases = {
    ls = "eza --icons=auto";
    ll = "eza -l --icons=auto";
    la = "eza -a --icons=auto";
    lt = "eza -T --icons=auto";
    lla = "eza -la --icons=auto";
  };
  environment.systemPackages = [ pkgs.eza ];
}
