#=====================================================
# 1. Environment Config
#=====================================================
# Add homebrew utils and man pages to paths
# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput setaf 7)\]________________________________________________________________________________\n\[$(tput setaf 7)\]|\[$(tput setaf 1)\]\t \[$(tput setaf 3)\]\w\n\[$(tput setaf 7)\]|\u@\H > \[$(tput sgr0)\]"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export EDITOR=/usr/bin/vim
#=====================================================
# 2. Aliases
#=====================================================
alias cp='cp -iv'
alias mv='mv -iv'
alias ls='ls -Fh --color=auto --group-directories-first'
alias grep='grep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'

alias printColors='for i in {0..256}; do echo -en "\e[38;5;${i}mColor: ${i}\e[0i\t"; if ! ((${i}%8)); then echo; fi done'
alias mypip='curl ip.appspot.com'
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#=====================================================
# scripts
#=====================================================
## Load the ls colors from their config file
eval `dircolors ~/.dir_colors`
