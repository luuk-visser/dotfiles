#!/usr/bin/env bash
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

shellrc=$HOME/.$(basename $SHELL)rc
alias reshell="source $shellrc"
alias shelledit="vi $shellrc"

