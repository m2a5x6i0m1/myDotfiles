return {
	settings = {
		nixd = {
			nixpkgs = {
				expr = 'import (builtins.getFlake "/home/max/nixos-dots").inputs.nixpkgs { }',
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/max/nixos-dots").nixosConfigurations."asus-laptop".options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/max/nixos-dots").nixosConfigurations."asus-laptop".options.home-manager.users.type.getSubOptions []',
				},
			},
		},
	},
}
