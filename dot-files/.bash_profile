# osx locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Android
export ANDROID_HOME='/Users/bfarber/DevTools/android-sdk-macosx'
export PATH=$PATH:$ANDROID_HOME:/Users/bfarber/DevTools/android-sdk-macosx/build-tools

# sublime
alias sbl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# brew
export PATH="/usr/local/bin:$PATH"

# term2 colors
export CLICOLOR=1

# vi bindings
set -o vi

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Powerline
function _update_ps1() {
    PS1="$(~/.go/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND=_update_ps1
fi

# enhancd
source ~/Development/enhancd/init.sh

# hh configs
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
