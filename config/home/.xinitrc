#! /bin/bash
setxkbmap -model pc105 -layout de -variant nodeadkeys
wicd-client -tn &
~/.fehbg &
exec i3
