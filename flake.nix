{
  description = "Matheus Flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Utilities for building our flake
    flake-utils.url = "github:numtide/flake-utils";

    # Extra flakes for modules, packages, etc
    hardware.url = "github:nixos/nixos-hardware"; # Convenience modules for hardware-specific quirks
    nur.url = "github:nix-community/NUR"; # User contributed pkgs and modules
    nix-colors.url = "github:misterio77/nix-colors"; # Color schemes for usage with home-manager
    impermanence.url = "github:riscadoa/impermanence"; # Utilities for opt-in persistance
    agenix.url = "github:ryantm/agenix"; # Secrets management

    nvimFlake.url = "github:gako358/neovim";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-colors,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = ["x86_64-linux" "aarch64-linux"];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
  in {
    inherit lib;
    overlays = {
      default = import ./overlay {inherit inputs outputs;};
    };
    packages = forEachSystem (pkgs: import ./pkgs {inherit pkgs;});
    devShells = forEachSystem (pkgs:
      import ./shell.nix {
        inherit pkgs;
        buildInputs = [
        ];
      });

    nixosConfigurations = {
      angreal = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          ./system
          ./hosts/angreal
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs outputs;
                hidpi = true;
              };
              backupFileExtension = ".hm-backup";
              users.matheus = {...}: {
                nixpkgs.config.allowUnfree = true;
                imports = [./modules];
              };
            };
          }
        ];
      };
    };
  };
}
