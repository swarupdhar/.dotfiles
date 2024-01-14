#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
black="\e[0;30m"
blue="\e[0;34m"
cyan="\e[0;36m"
green="\e[0;32m"
purple="\e[0;35m"
red="\e[0;31m"
white="\e[0;37m"
yellow="\e[0;33m"
boldYellow="\e[1;33m"


PS1="\n$boldYellow\u $green(\s) $blue\w$white\n>> "

alias ll='LC_COLLATE=c ls -alhF --color=always'
alias ls='LC_COLLATE=c ls --color=always'
alias grep='grep --color=auto'
alias dots='/usr/bin/git --git-dir=/home/swarup/.dotfiles --work-tree=/home/swarup'
