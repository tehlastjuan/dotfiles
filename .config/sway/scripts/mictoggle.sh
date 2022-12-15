#!/bin/bash

var="$(pactl get-source-mute 0)"
if [[ $var =~ "Mute: yes" ]]; then
  pactl set-source-mute 0 0 # Unmute PulseAudio Microphone.
  #notify-send -e -i audio-input-microphone PulseAudio 'Microphone Unmuted!'
  paplay /usr/share/sounds/freedesktop/stereo/device-added.oga
else
  pactl set-source-mute 0 1 # Mute PulseAudio Microphone.
  #notify-send -e -i microphone-disabled PulseAudio 'Microphone Muted!'
  paplay /usr/share/sounds/freedesktop/stereo/device-removed.oga
fi
