.PHONY: install neovim symlink clone setup

current_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

install:
	bash $(current_dir)/scripts/install-packages.sh

neovim:
	bash $(current_dir)/scripts/install-neovim.sh

symlink:
	bash $(current_dir)/scripts/symlink-configs.sh

clone:
	bash $(current_dir)/scripts/clone-repos.sh

setup: install neovim symlink clone
