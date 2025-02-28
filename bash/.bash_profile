echo "Setting aliases and exports"
alias pwgen='openssl rand 16 -base64'
alias ll="ls -l"
alias irc="irssi"

alias pine="alpine"
alias such=git
alias very=git
alias wow='git status' 
alias amaze='git pull --rebase'

alias ICanHaz='fortune|cowsay|lolcat'
alias vizgit='gource -2560x1024 -s 1 -i 2 -i 100 --high-dpi ../backend/'

alias shutdownVagrant='vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done'

alias webserver='python -m SimpleHTTPServer 8000'

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export GREP_OPTIONS='--color=auto'
export VISUAL=vi
export EDITOR=vi
export HOME=/Users/sgeidies
export GRADLE_USER_HOME=${HOME}/.gradle
export SSL_CERT_FILE=${HOME}/.ca_certs/ZscalerRootCertificate-2048-SHA256.pem

export BASH_SILENCE_DEPRECATION_WARNING=1


echo "Sourcing .bashrc"
if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

## ssh
echo "Setting up ssh"
SSH_ENV="$HOME/.ssh/environment"
function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add ~/.ssh/id_rsa
     /usr/bin/ssh-add ~/.ssh/id_ed25519
}
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

echo "setting up completions"
if [ -d $HOME/.completions ]; then
  for i in $HOME/.completions/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
## JAVA

echo "Setting up java"
export JAVA_HOME=`/usr/libexec/java_home -v 17`
export PATH=$PATH:/usr/local/lib/gradle/bin
export ANDROID_HOME=~/Library/Android/sdk

## ruby

echo "Setting up ruby"
export PATH=/opt/chefdk/bin:${PATH}
[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# eval "$(rbenv init -)"

echo "Setting up perl"
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

## clang / gcc

echo "Setting up clang/gcc"
export GOPATH=$HOME/src/go
# Only set temporary - fucks up ruby installation through rvm/rbenv
# export CC=/usr/bin/cc
# export CPP=/usr/bin/cpp

## git

echo "Setting up git"
export PS1="\t \W\$(git-radar --bash --fetch) \\$ "
export LC_CTYPE=en_US.UTF-8

echo "setting up brew"
export PATH="/usr/local/sbin:$PATH"
eval "$(/opt/homebrew/bin/rbenv init - bash)"

echo "setting up fastlane"
export PATH="$HOME/.fastlane/bin:$PATH"

echo "setting kubernetes aliases"
complete -C "mite auto-complete" mite

source $HOME/.profile

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/geidies_sebastian/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/geidies_sebastian/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/geidies_sebastian/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/geidies_sebastian/Downloads/google-cloud-sdk/completion.bash.inc'; fi

export PATH=${PATH}:${HOME}/bin
# alias cat=lolcat
