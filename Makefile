NIXUSER ?= tobias
NIXNAME ?= vm-aarch64

switch:
	sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --flake "${HOME}/.dotfiles#${NIXNAME}"
