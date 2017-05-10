#!/bin/bash

# Pulseaudio inc sound
SOUND=( $(pactl list sinks | perl -000ne 'if(/#0/){/(Lautstärke:.*)/; print "$1\n"}' | grep -o '[^ ]*%' | tr -d '%') );
if (( ${SOUND[0]} < 150 && ${SOUND[1]} < 150 )); then
	pactl set-sink-mute 0 false;
	pactl set-sink-volume 0 +5%;
fi

# Pulseaudio dec sound
# sh -c "pactl set-sink-mute 1 false ; pactl set-sink-volume 1 -5%"

# Pulseaudio extras
# pactl list sinks short
# sh -c "SOUND=( $(pactl list sinks | perl -000ne 'if(/#1/){/(Volume:.*)/; print "$1\n"}' | grep -o '[^ ]*%' | tr -d '%') ); if (( ${SOUND[0]} < 150 )); then pactl set-sink-mute 1 false ; pactl set-sink-volume 1 +5%; fi"

