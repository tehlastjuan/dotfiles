#
# ~/.bashrc
#

[[ $- != *i* ]] && return

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

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
DIRCOL=~/.config/dircolors/coldark
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

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.
shopt -s histappend

alias r='. ranger'
alias rd='rtv'
alias o='flatpak run md.obsidian.Obsidian'
alias v='vlc --intf ncurses'
alias d='cd ~/Documents'
alias l='cd ~/Downloads'
alias x='cd ~/Dropbox'
alias n='cd ~/.notes'
alias k='cd ~/.keybase/private/tehracoon/'
alias j='cd ~/Documents/j-practice'
alias js='cd ~/Documents/js-practice'
alias ui='cd ~/Documents/ui-practice'

# keychain on start
eval $(keychain --eval --quiet --noask --agents ssh id_ed25519 id_rsa)

# zoxide on start
eval "$(zoxide init bash)"

# gcc compiler shortcut
cr () { 
  clear;
  if [ -n "$(find ./ -name "prog.c" 2>/dev/null)" ]; then
    gcc -Wall -g 'prog.c' -lm -o 'prog.x';
    ./prog.x;
  else
    echo "No .c file found";
  fi
}

# gcc compiler shortcut CURSES
crc () { 
  clear;
  if [ -n "$(find ./ -name "prog.c" 2>/dev/null)" ]; then
    gcc -Wall -g 'prog.c' -lm -lncurses -o 'prog.x';
    ./prog.x;
  else
    echo "No .c file found";
  fi
}

# note taking
nn() {
  filename="$(date +%U-%y%m%d-%H%M%S)";
  nvim ~/.notes/"${filename}.md";
}

nh() {
  filename="$(date +%U-%y%m%d-%H%M%S)";
  nvim "${filename}.md";
}

#java compiler
jc() {
 javac -d ./bin src/breakout/*.java;
}

jr() {
 java -cp ./bin breakout.Program;
}

# texlive
# See /usr/local/texlive/2023/index.html for links to documentation.
# The TeX Live web site (https://tug.org/texlive/) contains any updates and corrections. 
# TeX Live is a joint project of the TeX user groups around the world; please consider supporting it by joining the group best for you. 
# The list of groups is available on the web at https://tug.org/usergroups.html.
# Add /usr/local/texlive/2023/texmf-dist/doc/man to MANPATH.
# Add /usr/local/texlive/2023/texmf-dist/doc/info to INFOPATH.
# Most importantly, add /usr/local/texlive/2023/bin/x86_64-linux to your PATH for current and future sessions.
# Logfile: /usr/local/texlive/2023/install-tl.logxport
export PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH

# Sigils darktheme
export SIGIL_USES_DARK_MODE=1

# run on start
# source ~/.scripts/onstart.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
