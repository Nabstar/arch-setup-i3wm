#!/bin/bash

INPUT=`echo -e "Shutdown\nReboot" | dmenu -i -nb '#C31616' -sb '#404040' -nf white`
case "$INPUT" in "Shutdown")  sudo shutdown -P now;; "Reboot")  sudo shutdown -r now;; esac
