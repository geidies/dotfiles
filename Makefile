.PHONY: default install save-atom

default: prepare %.vim

prepare: 
	git submodule update --init
	apm install --packages-file atom/.atom/packages.lst

vim/.vim/colors/%.vim: vim/.vim/colors/*/colors/%.vim
	ln -s $(subst vim/.vim/colors/,,$<) $@

install:
	stow atom
	stow bash
	stow completions
	stow gem
	stow git
	stow vim

save-atom:
	apm list --bare --installed > atom/.atom/packages.lst
