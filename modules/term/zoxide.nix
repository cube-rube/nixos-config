{ config, ... }: {
  flake.modules.hjem.term = config.flake.modules.hjem.zoxide;
  flake.modules.hjem.zoxide = {
    programs.zoxide = {
      enable = true;
      integrations.nushell.enable = true;
    };
  };
}
