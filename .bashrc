#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h] \w\n\$ '

alias ll='LC_COLLATE=c ls -alhF --color=always --group-directories-first'
alias ls='LC_COLLATE=c ls -lF --color=always'
alias grep='grep --color=auto'
alias dots='/usr/bin/git --git-dir=/home/swarup/.dotfiles --work-tree=/home/swarup'
