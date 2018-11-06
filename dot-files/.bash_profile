#-------------------------------------------------------------
# BASH PROFILE
#-------------------------------------------------------------

#-------------------------------------------------------------
# House keeping
#-------------------------------------------------------------

# osx locale, used for git
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#-------------------------------------------------------------
# Path exports
#-------------------------------------------------------------

# android
export ANDROID_HOME='/Users/bfarber/DevTools/android-sdk-macosx'
export PATH=$PATH:$ANDROID_HOME:/Users/bfarber/DevTools/android-sdk-macosx/build-tools

# brew
export PATH="/usr/local/bin:$PATH"

# go language
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# .bash folder
export PATH="~/.bash:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

#-------------------------------------------------------------
# Source-s activations
#-------------------------------------------------------------
# enhancd

source ~/.bash/enhancd/init.sh

#-------------------------------------------------------------
# Configs
#-------------------------------------------------------------

# Powerline
function _update_ps1() {
    PS1="$(~/.go/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND=_update_ps1
fi

# term2 colors
export CLICOLOR=1

# vi bindings
set -o vi

# hh
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hh -k \C-j"'; fi
#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# sublime from command line
alias sbl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

#-------------------------------------------------------------
# Functions
#-------------------------------------------------------------

# incremental string search in files
function inc() {
  sk --ansi -i -c 'ag --color "{}"' --preview "preview.sh {}"
}

# incremental string search in one huge file
function ss() {
  nl $1 | fzy --lines=100
}

function sss() {
   ls -lR | fzy --lines=100
}

