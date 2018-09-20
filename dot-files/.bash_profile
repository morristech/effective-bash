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

# git terminal - un comment if needed
#source ~/.bash/git-prompt.sh # Show git branch name at command prompt
#export GIT_PS1_SHOWCOLORHINTS=true # Option for git-prompt.sh to show branch name in color

# Terminal Prompt:
# Include git branch, use PROMPT_COMMAND (not PS1) to get color output (see git-prompt.sh for more)
#export PROMPT_COMMAND='__git_ps1 "\w" "\n\\\$ "' # Git branch (relies on git-prompt.sh)

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# powerline terminal
function _update_ps1() {
    PS1="$(~/.go/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND=_update_ps1
fi


# autojump
 [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
