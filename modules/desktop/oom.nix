{ config, ... }: {
  flake.modules.nixos.desktop = config.flake.modules.nixos.oom;
  flake.modules.nixos.oom = {
    systemd.oomd = {
      enable = true;
      enableRootSlice = true;
      enableUserSlices = true;
    };
    systemd.oomd.settings.OOM = {
      DefaultMemoryPressureLimit = "80%";
      DefaultMemoryPressureDurationSec = "20s";
    };
  };
}
