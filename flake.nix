{
  description = "NixOS configuration for desktop and laptop.";

  inputs = {
    nixpkgs.url = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    niri.url = "github:sodiboo/niri-flake";

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
      nixos-hardware,
      home-manager,
      stylix,
      niri,
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

          modules = modules ++ [ hostConfiguration ];
        };
    in
    {
      nixosConfigurations = {
        desktop = system ./hosts/desktop ++ nixos-hardware.nixosModules.lenovo-thinkpad-t495;
        laptop = system ./hosts/laptop;
      };
    };
}
