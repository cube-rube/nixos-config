{
  description = "Cuberub's NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org/"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    experimental-features = [
      "flakes"
      "nix-command"
      "pipe-operators"
    ];
    lazy-trees = true;
    show-trace = true;
    trusted-users = [ "@wheel" "@build" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix.url = "github:DeterminateSystems/nix-src";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-discord-youtube = {
      url = "github:kartavkun/zapret-discord-youtube";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    probe-rs-rules = {
      url = "github:jneem/probe-rs-rules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix,
    home-manager,
    agenix,
    zapret-discord-youtube,
    nix-index-database,
    ...
  } @ inputs: {

    nixosConfigurations.accord = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs // { inherit inputs; };
      modules = [
        ./hosts/accord/configuration.nix
        { nixpkgs.overlays = [ nix.overlays.default ]; }
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
      specialArgs = inputs // { inherit inputs; };
      modules = [
        ./hosts/nixrock/configuration.nix
        { nixpkgs.overlays = [ nix.overlays.default ]; }
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cuberub = ./hosts/nixrock/home.nix;
          home-manager.backupFileExtension = "bak";
        }

        agenix.nixosModules.default

        nix-index-database.nixosModules.nix-index
        { programs.nix-index-database.comma.enable = true; }

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
