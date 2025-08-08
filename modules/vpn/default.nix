{ config, pkgs, ... }:
{
  # environment.etc."wireguard/wg0.conf".text = builtins.readFile ./wg0.conf;
  # # networking.wireguard.enable = true;
  # networking.wg-quick.interfaces = {
  #   wg0 = {
  #     configFile = "/etc/wireguard/wg0.conf";
  #   };
  # };
}
