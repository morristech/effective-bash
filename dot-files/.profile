#-------------------------------------------------------------

# BASH PROFILE
#-------------------------------------------------------------

#-------------------------------------------------------------
# House keeping
#-------------------------------------------------------------

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#-------------------------------------------------------------
# Path exports
#-------------------------------------------------------------

# .bash folder
export PATH="~/.bash:$PATH"

# git extra status
export PATH=$PATH:$HOME/git-extra-status/bin

#-------------------------------------------------------------
# Source-s activations
#-------------------------------------------------------------
# enhancd

source ~/.bash/enhancd/init.sh

#-------------------------------------------------------------
# Configs
#-------------------------------------------------------------

# Powerline
#function _update_ps1() {
#   PS1="$(~/go/bin/powerline-go -error $?)"
#}

#if [ "$TERM" != "linux" ]; then
#    PROMPT_COMMAND=_update_ps1
#fi

# vi bindings
set -o vi

# Midnight Commander color scheme
export MC_SKIN=$HOME/.mc/solarized.ini

# Midnight Commander editor (nvim)
alias mc='EDITOR=nvim mc'

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# InstaSearch from command line
alias is='java -jar ~/jars/InstaSearch.jar'

# WSL root
alias w='cd /mnt/c'

