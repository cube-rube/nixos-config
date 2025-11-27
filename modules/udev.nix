{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.probe-rs-rules.nixosModules."x86_64-linux".default
  ];
  hardware.probe-rs.enable = true;
  services.udev.packages = [ pkgs.openocd ];
  services.udev.extraRules = ''
    # CMSIS-DAP for microbit
    ACTION!="add|change", GOTO="microbit_rules_end"
    SUBSYSTEM=="usb", ATTR{idVendor}=="0d28", ATTR{idProduct}=="0204", TAG+="uaccess"
    LABEL="microbit_rules_end"
  '';
}
