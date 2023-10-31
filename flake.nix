{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations.snowball = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./snowball.nix
      ];
    };
  };
  outputs = {nixpkgs, home-manager, hyprland, ...}: {
    homeConfigurations."cult@snowball" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      modules = [
        hyprland.homeManagerModules.default
        {wayland.windowManager.hyprland.enable = true;}
        ./modules/cult.nix
      ];
    };
  };
}

