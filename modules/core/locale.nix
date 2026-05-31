{
  flake.modules.nixos.locale = {
    time.timeZone = "Europe/Moscow";
    i18n.defaultLocale = "en_US.UTF-8";
    # i18n.extraLocales = ["ru_RU.UTF-8/UTF-8"];
    i18n.extraLocaleSettings = {
      # LC_ADDRESS = "ru_RU.UTF-8";
      LC_COLLATE = "C.UTF-8"; # ordering rules
      # LC_CTYPE = "en_US.UTF-8";
      # LC_IDENTIFICATION = "ru_RU.UTF-8";
      # LC_MEASUREMENT = "ru_RU.UTF-8";
      # LC_MESSAGES = "en_US.UTF-8";
      # LC_MONETARY = "ru_RU.UTF-8";
      # LC_NAME = "ru_RU.UTF-8";
      # LC_NUMERIC = "ru_RU.UTF-8";
      # LC_PAPER = "ru_RU.UTF-8";
      # LC_TELEPHONE = "ru_RU.UTF-8";
      # LC_TIME = "ru_RU.UTF-8";
    };
    services.xserver.xkb = {
      layout = "us,ru";
      options = "grp:win_space_toggle";
    };
  };
}
