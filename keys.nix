let
  keys = {
    cuberub = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDZlzl9DjkESzlZumKAlDaczNObmxEmdB/haEdJcuFB9";
    nixrock = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoT3MsbrFPrp2q71+aKPqDQZCDpw3mSIRL8yIudx0gx";
  };
in keys // {
  cuberub-nixrock = [ keys.cuberub keys.nixrock ];
}
