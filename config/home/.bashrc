#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias vim='vim -u NONE'

cdd() { cd "$@" && ls -all; }
fehbg() { feh --bg-fill "$(xsel -b)"; }
