#!/bin/bash

INPUT=`echo -e "Shutdown\nReboot\nLock" | dmenu -i -nb '#C31616' -sb '#404040' -nf white`
case "$INPUT" in "Shutdown")  sudo shutdown -P now;; "Reboot")  sudo shutdown -r now;; "Lock") scrot /tmp/i3lock.png && i3lock -i /tmp/i3lock.png;; esac
