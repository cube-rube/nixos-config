{
  flake.modules.nixos.syncthing =
    let
      primaryUser = "cuberub";
    in
    {
      services.syncthing = {
        enable = true;
        user = primaryUser;
        dataDir = "/home/${primaryUser}";
        configDir = "/home/${primaryUser}/.config/syncthing";
      };
    };

   # idk man
  
   # flake.modules.hjem.syncthing =
   #   { lib, pkgs, ... }:
   #   let
   #     inherit (lib.lists) singleton;
   #     inherit (lib.cli) toCommandLineShellGNU;
   #     inherit (lib.meta) getExe;
   
   #     package = pkgs.syncthing;
   #   in
   #   {
   #     packages = singleton package;
  
   #     systemd.services = {
   #       syncthing = {
   #         description = "Syncthing - Open Source Continuous File Synchronization";
   #         documentation = "man:syncthing(1)";
   #         after = singleton "network.target";
   #         wantedBy = singleton "default.target";
   #         startLimitIntervalSec = 60;
   #         startLimitBurst = 4;
  
   #         environment = {
   #           STLOGFORMATTIMESTAMP = "";
   #           STLOGFORMATLEVELSTRING = "false";
   #           STLOGFORMATLEVELSYSLOG = "true";
   #         };
  
   #         serviceConfig = {
   #           ExecStart =
   #             let
   #               args = toCommandLineShellGNU { } {
   #                 "gui-address" = "127.0.0.1:8384";
   #                 "no-browser" = true;
   #                 "no-restart" = true;
   #                 "no-upgrade" = true;
   #               };
   #             in
   #             "${getExe package} serve ${args}";
   #           Restart = "on-failure";
   #           SuccessExitStatus = "3 4";
   #           RestartForceExitStatus = "3 4";
             
   #           SystemCallArchitectures = "native";
   #           MemoryDenyWriteExecute = true;
   #           NoNewPrivileges = true;

   #           LockPersonality = true;
   #           PrivateUsers = true;
   #           RestrictNamespaces = true;
   #           SystemCallFilter = "@system-service";
   #         };
   #       };
   #     };
   #   };
}
