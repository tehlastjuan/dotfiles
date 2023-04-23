#!/bin/sh

# make default editor Neovim
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

# Most pure GTK3 apps use wayland by default, but some,
# like Firefox, need the backend to be explicitely selected.
# export MOZ_ENABLE_WAYLAND=1
# export MOZ_DBUS_REMOTE=1
export GTK_CSD=0

# qt wayland
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

#Java XWayland blank screens fix
export _JAVA_AWT_WM_NONREPARENTING=1

# set default shell and terminal
export SHELL=/usr/bin/bash
export TERMINAL=foot
export TERMINAL_COMMAND=/usr/share/sway/scripts/foot.sh
export TERM_CMD=/usr/share/sway/scripts/foot.sh
export BROWSER=/usr/bin/brave

# Disable hardware cursors. This might fix issues with
# disappearing cursors
export WLR_NO_HARDWARE_CURSORS=1

# load ranger conf only once
export RANGER_LOAD_DEFAULT_RC=false

# bash 
export HISTCONTROL="erasedups:ignorespace"
