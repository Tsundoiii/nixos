{
  description = "NixOS configuration for desktop and laptop.";

  inputs = {
    nixpkgs.url = "nixpkgs";
    niri.url = "github:epireyn/niri-flake";
    waveforms.url = "github:DragonHuntrX/waveforms-flake-local";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      niri,
      waveforms,
      nixos-hardware,
      home-manager,
      stylix,
      nix-vscode-extensions,
      ...
    }:
    let
      specialArgs = {
        inherit niri;
        inherit nix-vscode-extensions;
      };

      modules = [
        ./system

        niri.nixosModules.niri
        waveforms.nixosModule
        stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.tsundoiii = import ./home/home.nix;
          };
        }
      ];

      system =
        hostConfiguration:
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;

          modules = modules ++ hostConfiguration;
        };
    in
    {
      nixosConfigurations = {
        desktop = system [ ./hosts/desktop ];

        laptop = system [
          ./hosts/laptop
          nixos-hardware.nixosModules.lenovo-thinkpad-t495
        ];
      };
    };
}
