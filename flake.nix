/*
  flake.nix

  Nix flake that configures Home Manager for the user's dotfiles. This flake
  exposes `homeConfigurations.<username>` which Home Manager uses to apply the
  user's configuration on the local system. Keep this file declarative — use
  `home/packages.nix` for the package list and small local modules for
  overrides.
*/

{
  description = "Home Manager packages for my dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # Replace with your actual system architecture if different
      username = "username"; # Replace with your actual username
    in {
      homeConfigurations.${username} =
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
          };

          modules = [
            ./home/packages.nix

            {
              home = {
                inherit username;
                homeDirectory = "/home/${username}";

                # Update deliberately after reviewing Home Manager release notes.
                stateVersion = "25.05";
              };
            }
          ];
        };
    };
}