{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations.snowball = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./snowball.nix
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           home-manager.users.cult = import ./cult.nix;

           # Optionally, use home-manager.extraSpecialArgs to pass
           # arguments to home.nix
         }
      ];
    };
  };
}
