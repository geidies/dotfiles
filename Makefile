.PHONY: default install

default:
	git submodule update --init
	apm install --packages-file atom/packages.lst

install:
	stow atom
	stow bash
	stow completions
	stow gem
	stow git
	stow vim
