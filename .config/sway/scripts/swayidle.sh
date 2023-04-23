#!/bin/bash

# pgrep swayidle || swayidle -w \
#     timeout 240 'light -G > /tmp/brightness && light -S 10' resume 'light -S $([ -f /tmp/brightness ] && cat /tmp/brightness || echo 100%)' \
#     timeout 300 '~/.config/sway/scripts/swaylock.sh' \
#     timeout 420 'systemctl suspend' \
#     before-sleep '~/.config/sway/scripts/swaylock.sh & system suspend;' \
#     after-resume 'swaymsg "output * dpms on"'\
#     &

### swayidle
exec swayidle -w \
    timeout 240 'light -G > /tmp/brightness && light -S 10' resume 'light -S $([ -f /tmp/brightness ] && cat /tmp/brightness || echo 100%)' \
    timeout 300 '~/.config/sway/scripts/swaylock.sh' \
    timeout 420 'systemctl suspend' \
    before-sleep '~/.config/sway/scripts/swaylock.sh & system suspend;' \
    after-resume 'swaymsg "output * dpms on"' \
    &
    
