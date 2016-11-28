#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="${PATH}:/home/$USER/.bin"

if [[ "$(tty)" == '/dev/tty1' ]]; then
    startx
fi
