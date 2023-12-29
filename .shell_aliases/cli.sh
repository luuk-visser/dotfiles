alias ..='cd ..'

shellrc=$HOME/.$(basename $SHELL)rc
alias reshell="source $shellrc"
alias shelledit="vi $shellrc"

