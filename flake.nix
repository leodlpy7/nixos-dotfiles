{
  description = "nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs@{self, nixpkgs, home-manager, ...}: {
    nixosConfigurations.amaterasu = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
      	./machines/amaterasu
        home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useUserPackages = true;
	    useGlobalPkgs = true;
	    users.leo = import ./home/leo/default.nix;
	  };
	}
      ];
    };
  };
}
