#!/bin/bash

# bash completion for rake
#
# INSTALL
#
# Place in your bash completions.d and/or source in your .bash_profile
# If on a Mac with Homebrew, try "brew install bash-completion"
# 
# USAGE
#
# Type 'rake' and hit tab twice to get completions.
# To clear the cache, run rake_cache_clear() in your shell.
#

function _rakecomplete() {
  # error if no Rakefile
  if [ ! -e Rakefile ]; then
    echo "missing Rakefile"
    return 1
  fi

  local tasks=`rake -s -T --all | awk '{print $2}'`
  COMPREPLY=($(compgen -W "${tasks}" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

complete -o default -o nospace -F _rakecomplete rake