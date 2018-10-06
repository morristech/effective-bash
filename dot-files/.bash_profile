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
