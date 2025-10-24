{
  description = "Cuberub's NixOS configuration";

  nixConfig = {
    experimental-features = [
      "flakes"
      "nix-command"
      "pipe-operators"
    ];
    lazy-trees = true;
    show-trace = true;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      determinate,
      chaotic,
      home-manager,
      agenix,
      zapret-discord-youtube,
      nix-index-database,
      ...
    }@inputs:
    let
      inherit (builtins) readDir;
      hosts = readDir ./hosts;
    in
    {
      nixosConfigurations.accord = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs // {
          inherit inputs;
        };
        modules = [
          ./hosts/accord/configuration.nix
          determinate.nixosModules.default
          agenix.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cuberub = ./hosts/accord/home.nix;
            home-manager.backupFileExtension = "bak";
          }
          nix-index-database.nixosModules.nix-index
          { programs.nix-index-database.comma.enable = true; }
        ];
      };
      nixosConfigurations.nixrock = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs // {
          inherit inputs;
        };
        modules = [
          ./hosts/nixrock/configuration.nix
          determinate.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cuberub = ./hosts/nixrock/home.nix;
            home-manager.backupFileExtension = "bak";
          }
          nix-index-database.nixosModules.nix-index
          { programs.nix-index-database.comma.enable = true; }
          chaotic.nixosModules.default
          
          zapret-discord-youtube.nixosModules.default
          {
            services.zapret-discord-youtube = {
              enable = true;
              config = "general (FAKE_TLS_AUTO_ALT2)";
            };
          }
        ];
      };
    };
}
