#!/usr/bin/env bash

swaylock --indicator-radius 90 \
  --indicator-thickness 20 \
  --inside-color 00000000 \
  --inside-clear-color 00000000 \
  --inside-ver-color 00000000 \
  --inside-wrong-color 00000000 \
  --key-hl-color "$color12" \
  --bs-hl-color "$color14" \
  --ring-color 00000000 \
  --ring-clear-color ffffff00 \
  --ring-wrong-color "$color8" \
  --ring-ver-color "$color14" \
  --line-uses-ring \
  --line-color 00000000 \
  --font 'RobotoMono Nerd Font Mono:style=Regular 20' \
  --text-color 00000000 \
  --text-clear-color 00000000 \
  --text-wrong-color 00000000 \
  --text-ver-color 0000000 \
  --separator-color 00000000 \
  --show-failed-attempts \
  --fade-in 0.2 \
  --grace 1 \
  --effect-vignette 0.4:0.4 \
  --effect-pixelate 20 \
  --ignore-empty-password \
  --screenshots \
  --hide-keyboard-layout \
  --daemonize

