{
    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-24.11";
        };
        nixpkgs-unstable = {
            url = "github:nixos/nixpkgs/nixos-unstable";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-colors = {
            url = "github:misterio77/nix-colors";
        };
        nixvim = {
            url = "github:steven-na/nixvim-config";
        };
        spicetify-nix = {
            url = "github:Gerg-L/spicetify-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        zen-browser.url = "github:0xc000022070/zen-browser-flake";
    };

    outputs =
        inputs@{
            nixpkgs,
            home-manager,
            ...
        }:
        let
            system = "x86_64-linux"; # change to whatever your system should be
            nixfmt-overlay = import ./overlays/nixfmt.nix;
            pkgs = import nixpkgs {
                inherit system;
                overlays = [ nixfmt-overlay ];
            };
        in
        {
            formatter.x86_64-linux = pkgs.nixfmt-rfc-style;

            nixosConfigurations = {
                main = nixpkgs.lib.nixosSystem {
                    system = "x86_64-linux";
                    specialArgs = { inherit inputs; };
                    modules = [
                        home-manager.nixosModules.home-manager
                        ./config/main
                    ];
                };
            };

            homeConfigurations = {
                "blakec@main" = home-manager.lib.homeManagerConfiguration {
                    pkgs = import nixpkgs {
                        inherit system;
                        overlays = [ ];
                    };
                    extraSpecialArgs = {
                        inherit system;
                        inherit inputs;
                    };
                    modules = [
                        ./homeManager/main
                    ];
                };
            };
        };
}
