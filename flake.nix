{
  description = "My system configuration";
  inputs = {
    # Where we get most of our software. Giant mono repo with recipes
    # called derivations that say how to build software.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Manages configs links things into your home directory
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Controls system level software and settings including fonts
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    get-flake.url = "github:ursi/get-flake";
  };

  outputs = {
    self,
    darwin,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Ethans-MacBook-Pro
    darwinConfigurations."MacBook_Air_de_Mateo" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
      };
      modules = [
        ./modules/darwin.nix
        ./modules/homebrew.nix
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.mateoroldos.imports = [./modules/home-manager.nix];
            extraSpecialArgs = {
              inherit inputs;
            };
          };

          system.configurationRevision = self.rev or self.dirtyRev or null;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."MacBook_Air_de_Mateo".pkgs;
  };
}
