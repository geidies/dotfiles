#!/bin/sh

KNOWN_HOSTS=$( cat ~/.ssh/known_hosts | \
    cut -f 1 -d ' ' | sed -e s/,.*//g | \
    sort -u | grep -v "\[")
SSH_CONFIG=$(cat ~/.ssh/config | grep -v '*' | perl -ne 'print $1.$/ if /^Host (\S+)/')

complete -W "$(echo ${KNOWN_HOSTS} ${SSH_CONFIG} | sort | uniq)" ssh
