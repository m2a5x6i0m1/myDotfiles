return {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_markers = { "flake.nix", ".git", "shell.nix" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = 'import (builtins.getFlake "/home/max/myNixOS").inputs.nixpkgs { }',
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/max/myNixOS").nixosConfigurations."desktop".options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/max/myNixOS").nixosConfigurations."desktop".options.home-manager.users.type.getSubOptions []',
				},
			},
			formatting = {
				command = { "nixfmt" },
			},
		},
	},
}
