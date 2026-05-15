{
  flake.modules.hjem.zoxide = {
    programs.zoxide = {
      enable = true;
      integrations.nushell.enable = true;
    };
  };
}
