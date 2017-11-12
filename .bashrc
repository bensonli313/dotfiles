# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#applying tmux config file
#tmux source-file ~/.tmux.conf

#If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Interactive options
alias ls='ls -F --color'
alias rm='rm -i'

alias df='df -h'
alias du='du -h'

alias grep='grep --color'
alias egrep='egrep --color=auto'

# added by Anaconda3 4.3.1 installer
export PATH="$PATH:/home/benson/Software/anaconda3/bin"
export PATH="$PATH:/home/benson"
export PATH="$PATH:/home/benson/Software/Matlab/bin"
export PATH="$PATH:/home/benson/Software/usr/local/lib/light"
#export PATH="$PATH:/home/benson/.cabal/bin"
alias home='cd ~/Documents/'
alias code='cd ~/Desktop/Code'
alias notes='cd ~/Desktop/Notes'
alias vi='vim'

if [ -f $HOME/.shell_prompt.sh ]; then
	    . $HOME/.shell_prompt.sh
    fi
alias seegit='git log --graph --full-history --all --color \
	        --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
export EDITOR='vim'
export VISUAL='vim'

alias vimp='cd /home/benson/.vim/plugged'
alias matlab='matlab -nodesktop -logfile output.log'
alias matlab2='matlab -nojvm -nodisplay -nosplash'
alias matlabgui='~/Software/Matlab/bin/matlab'
alias lab='cd /home/benson/Software/imsaneV1.2'

function readm {
    markdown-pdf $1.md -o $1.pdf | zathura $1.pdf
}
alias alg='cd /home/benson/Desktop/Books\ for\ Future/Textbooks/Math/Geometric\ Algebra'
alias textb='cd /home/benson/Desktop/Books\ for\ Future/Textbooks/'
alias tkill='tmux kill-ses -t'

alias ptime='python -m cProfile -s cumulative'

alias nvimp="cd /home/benson/.nvim/plugged/repos/github.com/"
#alias ipython="/home/benson/Software/anaconda3/bin/ipython"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias pstree='ps axjf'
alias ps='ps aux'
alias p3='python3'
alias du='du -sh'
alias df='df -h'
alias snip='cd /home/benson/.vim/plugged/vim-snippets/snippets'
alias imsane='cd /home/benson/Software/imsaneV1.2/examples'
alias jup='/home/benson/Software/anaconda3/bin/jupyter notebook'
alias jup2='/home/benson/Software/anaconda3/bin/jupyter'
alias pip6='/home/benson/Software/anaconda3/bin/pip'
alias ipy='/home/benson/Software/anaconda3/bin/ipython'
alias sE='find . -print | grep'
alias act='source activate'
alias deact='source deactivate'
alias tigall='tig --all'
alias pytest3='python3.6 -m pytest'
alias py='python3.6'
alias rsync='rsync -avHe ssh'
alias ilastik='/home/benson/Software/ilastik-1.2.2-Linux/run_ilastik.sh'
alias attach='tmux a -t'
alias switch='tmux switch-client -t'

alias npm='/home/benson/Software/node-v8.6.0-linux-x64/bin/npm'
alias node='/home/benson/Software/node-v8.6.0-linux-x64/bin/node'
alias swap='cd /home/benson/.local/share/nvim/swap'

alias nv='nvim'
