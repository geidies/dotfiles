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

alias shutdownVagrant='vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done'

alias webserver='python -m SimpleHTTPServer 8000'

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export GREP_OPTIONS='--color=auto'
export VISUAL=vi
export EDITOR=vi

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
     /usr/bin/ssh-add;
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
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH=$PATH:/usr/local/lib/gradle/bin

## ruby

echo "Setting up ruby"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init -)"
export PATH=/opt/chefdk/bin:${PATH}


## DOCKER

# echo "Setting up docker"
# B2D_STATUS=$(boot2docker status)
# if [ "$B2D_STATUS" != "running" ]; then
#   echo "boot2docker is not running. Status is: $B2D_STATUS."
#   echo "Trying to powerup."
#   boot2docker up
# fi
# eval $(boot2docker shellinit 2>/dev/null)

echo "Setting up docker"
B2D_STATUS=$(docker-machine status default)
if [ "$B2D_STATUS" != "Running" ]; then
  echo "docker-machine is not running. Status is: $B2D_STATUS."
  echo "Trying to powerup."
  docker-machine start default
fi
eval $(/usr/local/bin/docker-machine env default 2>/dev/null)

## clang / gcc

echo "Setting up clang/gcc"
export GOPATH=$HOME/src/go
export CC=/usr/bin/cc
export CPP=/usr/bin/cpp

## git

echo "Setting up git"
export PS1="\t \W\$(git-radar --bash --fetch) \\$ "
export LC_CTYPE=en_US.UTF-8


complete -C "mite auto-complete" mite
