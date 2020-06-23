#!/bin/bash
#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

# Configure GIT completion / prompt
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash
[ -f /usr/share/git/completion/git-prompt.sh ] && source /usr/share/git/completion/git-prompt.sh

export PS1='\[$(tput bold)\]\[$(tput setaf 1)\]\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]$(__git_ps1 " (%s)")\[$(tput setaf 7)\]\n\$ \[$(tput sgr0)\]'

[ -f "$HOME/.shortcuts" ] && source "$HOME/.shortcuts" # Load shortcut aliases

export GPG_TTY=$(tty)

# Some aliases
alias vi="nvim"
alias r="ranger"
alias bw="wal -i ~/.config/wall.png" # Rerun pywal
alias nanovna="pushd ~/Git/Electronics/nanovna-saver; python3 nanovna-saver.py; popd"

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -FlahN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
alias YT="youtube-viewer"

shdl() { curl -O $(curl -s http://sci-hub.tw/"$@" | grep location.href | grep -o http.*pdf) ;}
vf() { $EDITOR $(fzf) ;}

# Support for Azure CLI
# install: curl -L https://aka.ms/InstallAzureCli | bash
export PATH=$PATH:~/bin:~/.local/bin:~/.gem/ruby/2.7.0/bin

[ -f "$HOME/lib/azure-cli/az.completion" ] && source "$HOME/lib/azure-cli/az.completion"
