{
  description = "NixOS flake for configuring desktop and laptop.";

  inputs = {
    nixpkgs.url = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      ...
    }:
    let
      modules = [
        ./configuration.nix

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
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          modules = modules ++ [ ./hosts/desktop ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          modules = modules ++ [ ./hosts/laptop ];
        };
      };
    };
}
