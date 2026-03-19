{
  description = "Baby's first flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
	./configuration.nix
      ];
    };

    devShells."x86_64-linux".default = pkgs.mkShell {
      packages = [
        pkgs.python3
      ];
    };

  };
}
