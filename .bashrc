#=====================================================
# 1. Environment Config
#=====================================================
# Add homebrew utils and man pages to paths
# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="________________________________________________________________________________\n| \[\e[38;5;196m\]\t\[\e[38;5;214m\] \w \n\[\e[38;5;253m\]| \[\e[38;5;241m\]\u@\H\[\e[38;5;253m\] > "
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export EDITOR=/usr/bin/vim
export JAVA_HOME=$(/usr/libexec/java_home)

#=====================================================
# 2. Aliases
#=====================================================
alias cp='cp -iv'
alias mv='mv -iv'
alias ls='ls -Fh --color=auto --group-directories-first'
alias grep='grep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'

alias mypip='curl ip.appspot.com'
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
#=====================================================
# scripts
#=====================================================
## Load the ls colors from their config file
eval `dircolors ~/.dir_colors`

cd () {
	builtin cd "$@" && ls;
}
