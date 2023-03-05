#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# colors() {
# 	local fgc bgc vals seq0
#
# 	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
# 	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
# 	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
# 	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"
#
# 	# foreground colors
# 	for fgc in {30..37}; do
# 		# background colors
# 		for bgc in {40..47}; do
# 			fgc=${fgc#37} # white
# 			bgc=${bgc#40} # black
#
# 			vals="${fgc:+$fgc;}${bgc}"
# 			vals=${vals%%;}
#
# 			seq0="${vals:+\e[${vals}m}"
# 			printf "  %-9s" "${seq0:-(default)}"
# 			printf " ${seq0}TEXT\e[m"
# 			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
# 		done
# 		echo; echo
# 	done
# }

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true


# `dircolors` prints out `LS_COLORS='...'; export LS_COLORS`, so eval'ing
# $(dircolors) effectively sets the LS_COLORS environment variable.
# eval `dircolors ~/.config/dircolors/bliss.dircolors`
DIRCOL=~/.config/dircolors/dracula

# from https://codeberg.org/dnkl/foot/wiki#user-content-emojis-are-black-and-white
# eval $(env TERM=xterm-256color dircolors $DIRCOL)

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f $DIRCOL   ]] && match_lhs="${match_lhs}$(<$DIRCOL)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f $DIRCOL ]] ; then
			eval $(dircolors -b $DIRCOL)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=always'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

#alias cp="cp -i"                          # confirm before overwriting something
#alias df='df -h'                          # human-readable sizes
#alias free='free -m'                      # show sizes in MB
#alias np='nano -w PKGBUILD'
#alias more=less

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.
shopt -s histappend

alias r='. ranger'
alias rd='rtv'
alias o='flatpak run md.obsidian.Obsidian'
alias v='vlc --intf ncurses'
alias d='cd ~/Documents'
alias l='cd ~/Downloads'
alias x='cd ~/Dropbox'
alias k='cd /keybase'
alias j='cd ~/Documents/j-practice'
alias w='cd ~/Documents/w-practice'
alias js='cd ~/Documents/js-practice'

# keychain on start
eval $(keychain --eval --quiet --noask --agents ssh id_ed25519 id_rsa)

# zoxide on start
eval "$(zoxide init bash)"

# starship
# eval "$(starship init bash)"

# gcc compiler shortcut
cr () 
{ 
  clear;
  if [ -n "$(find ./ -name "prog.c" 2>/dev/null)" ]; then
    gcc -Wall -g 'prog.c' -lm -o 'prog.x';
    ./prog.x;
  else
    echo "No .c file found";
  fi
}

# gcc compiler shortcut CURSES
crc () 
{ 
  clear;
  if [ -n "$(find ./ -name "prog.c" 2>/dev/null)" ]; then
    gcc -Wall -g 'prog.c' -lm -lncurses -o 'prog.x';
    ./prog.x;
  else
    echo "No .c file found";
  fi
}

# note taking
n()
{
  filename="$(date +%U-%y%m%d-%H%M%S)";
  nvim ~/.notes/"${filename}.md";
}
nn()
{
  filename="$(date +%U-%y%m%d-%H%M%S)";
  nvim "${filename}.md";
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
