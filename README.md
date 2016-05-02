dotfiles
========

A collection of configuration to be used across computers. 

## Installation ##

Clone the directory into a subfolder of the home directory

    git clone https://github.com/geidies/dotfiles.git ~/dotfiles

Prepare the installation by checking out the submodules (vim plugins) and installing the atom packages. This is also done my the default target in the Makefile:

    make

After that, you can use `stow` to symlink the various folders into your home dir.

    stow vim
    stow bash
    stow completions
    # etc...

Or simply install all the symlinks:

    make install
