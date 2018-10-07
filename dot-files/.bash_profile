alias sbl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

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

# history with fzf
alias hh='cat ~/.bash_history | sort -u | uniq -u | fzf --reverse | bash'
