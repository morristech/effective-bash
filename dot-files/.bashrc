#-------------------------------------------------------------
# BASH PROFILE
#-------------------------------------------------------------

#-------------------------------------------------------------
# Path exports
#-------------------------------------------------------------

# brew
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# .bash folder
export PATH="~/.bash:$PATH"

# go
export PATH="~/go/bin:$PATH"

#-------------------------------------------------------------
# Source-s activations
#-------------------------------------------------------------
# enhancd

source ~/.bash/enhancd/init.sh

#-------------------------------------------------------------
# Configs
#-------------------------------------------------------------

# vi bindings
set -o vi

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# InstaSearch from command line
alias is='java -jar ~/jars/InstaSearch.jar'

# mc
alias mc='EDITOR=sublime mc'

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fh - repeat history
runcmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, <>' ; }

fh() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | runcmd
}

# fhe - repeat history edit
writecmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; }

fhe() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}


