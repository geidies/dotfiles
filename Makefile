.PHONY: default install save-atom

default:
	git submodule update --init
	apm install --packages-file atom/.atom/packages.lst

install:
	stow atom
	stow bash
	stow completions
	stow gem
	stow git
	stow vim

save-atom:
	apm list --bare --installed > atom/.atom/packages.lst
