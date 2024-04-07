#!/bin/env bash

set -e

# source: https://wiki.archlinux.org/title/Dunst

# Arbitrary but unique message tag
msgTag="volumeChanged"

# Change the volume based on passed in argument
if [[ $1 == "up" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ +2%
elif [[ $1 == "down" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -2%
fi

# Query the current volume
volume="$( 
    pactl get-sink-volume @DEFAULT_SINK@ | 
    awk '{split($0,a,"/");print a[2]}' | 
    sed 's/[^0-9]*//g' 
)"

# Check muted status
isMuted="$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{split($0,a,":");print a[2]}' | sed 's/ //g')"

if [[ $volume == 0 || $isMuted == "yes" ]]; then
    dunstify \
        -a "volume.sh" \
        -u low \
        -i audio-volume-muted \
        -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
else
    dunstify \
        -a "volume.sh" \
        -u low \
        -i audio-volume-high \
        -h string:x-dunst-stack-tag:$msgTag \
        -h int:value:"$volume" "Volume: ${volume}%"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "volume.sh"
