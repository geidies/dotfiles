.PHONY: default install save-atom

VIM_COLORS = vim/.vim/colors/
COLOR_SRC = $(wildcard vim/.vim/colors/*/colors/*.vim)
COLOR_TARGETS = $(addprefix vim/.vim/colors/,$(notdir $(COLOR_SRC)))

default: prepare $(COLOR_TARGETS)

prepare: 
	git submodule update --init
	# apm install --packages-file atom/.atom/packages.lst

$(COLOR_TARGETS): $(COLOR_SRC)
	ln -s $(subst vim/.vim/colors/,,$<) $@

print-%  : ; @echo $* = $($*)

install:
	stow atom
	stow bash
	stow completions
	stow gem
	stow git
	stow vim

save-atom:
	apm list --bare --installed > atom/.atom/packages.lst
