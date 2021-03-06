# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=no

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ipython alias
# alias python="ipython"

##########################
# Aliases for Hivelocity #
#################################################################################################################################################################################

alias vu="vagrant up"
alias vd="vagrant destroy"

alias sshared="workon hivelocity-shared; vu;"
alias sintra="workon intranet.hivelocity.net; django-admin.py syncdb; django-admin.py migrate; while true; do sleep 1; django-admin.py runserver_plus 127.0.0.1:8010; done;"
alias smy="workon my.hivelocity.net; django-admin.py syncdb; django-admin.py migrate; while true; do sleep 1; django-admin.py runserver_plus 127.0.0.1:8011; done;"
alias sstore="workon store.hivelocity.net; django-admin.py syncdb; django-admin.py migrate; while true; do sleep 1; django-admin.py runserver_plus 127.0.0.1:8012; done;"
alias swww="workon www.hivelocity.net; django-admin.py syncdb; django-admin.py migrate; python bin/build_urls.py; django-admin.py loaddata test_products; while true; do sleep 1; django-admin.py runserver_plus 127.0.0.1:8013; done;"
alias suberhooks="workon uberhooks.hivelocity.net; django-admin.py syncdb; django-admin.py migrate; while true; do sleep 1; django-admin.py runserver_plus 127.0.0.1:8015; done;"

#################################################################################################################################################################################


# Zach's Aliases
################
alias pyma="python manage.py"
alias runserver="while true; do sleep 1; python manage.py runserver_plus 127.0.0.1:8000; done;"


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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# JasonTweaks

# Virtual Env Wrapper
export WORKON_HOME=$HOME/ENVS
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh


# tmux colors fix
alias tmux="TERM=screen-256color-bce tmux"

# dat lolcommits
export LOLCOMMITS_DELAY=3
export LOLCOMMITS_ANIMATE=3
export LOLCOMMITS_DEVICE=/dev/video1

# MASSIVE HISTORY, BECAUSE IT'S THE 2000'S BABY!
shopt -s histappend
export HISTFILESIZE=500000
export HISTSIZE=100000
shopt -s cmdhist
export HISTTIMEFORMAT="%F %T "

#justvimthings
# Vim with clipboard support
alias vim='gvim -v'
export EDITOR='vim'

# Add to $PATH
export PATH=$PATH:$HOME/bin/

# Python Settings
export PYTHONDONTWRITEBYTECODE=1
[ -f ~/.pythonrc.py ] && export PYTHONSTARTUP=~/.pythonrc.py

export PS1="\n\u@\h-\w\n$ "
