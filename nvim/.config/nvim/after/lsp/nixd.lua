return {
	settings = {
		nixd = {
			nixpkgs = {
				expr = 'import (builtins.getFlake "/home/max/myNixOS").inputs.nixpkgs { }',
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/max/myNixOS").nixosConfigurations."laptop".options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/max/myNixOS").nixosConfigurations."laptop".options.home-manager.users.type.getSubOptions []',
				},
			},
		},
	},
}
