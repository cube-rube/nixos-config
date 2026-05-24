{
  flake.modules.nixos.oom = {
    systemd.oomd.enable = true;
    systemd.oomd.settings.OOM = {
      DefaultMemoryPressureLimit = "75%";
    };
  };
}
