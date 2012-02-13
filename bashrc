#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

prompt_command () {
    local rts=$?
    local w=$(echo "${PWD/#$HOME/~}" | sed 's/.*\/\(.*\/.*\/.*\)$/\1/') # pwd max depth 3
# pwd max length L, prefix shortened pwd with m
    local L=30 m='<'
    [ ${#w} -gt $L ] && { local n=$((${#w} - $L + ${#m}))
    local w="\[\033[0;32m\]${m}\[\033[0;37m\]${w:$n}\[\033[0m\]" ; } \
    ||   local w="\[\033[0;37m\]${w}\[\033[0m\]"
# different colors for different return status
    [ $rts -eq 0 ] && \
    local p="\[\033[1;30m\]>\[\033[0;32m\]>\[\033[1;32m\]>\[\033[m\]" || \
    local p="\[\033[1;30m\]>\[\033[0;31m\]>\[\033[1;31m\]>\[\033[m\]"
    PS1="${w} ${p} "
}
PROMPT_COMMAND=prompt_command

export EDITOR=vim

# use keychain for ssh convenience
eval `keychain --eval --agents ssh id_dsa --quiet`

alias g=git
alias ll='ls -l'
alias y=yaourt
alias py=bpython
alias py2=bpython2

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Packager specific things
alias db-aur='ssh aur.archlinux.org /arch/db-update'
alias svnex='svn up --set-depth exclude'
chop() {
  tagurit
  urlwatch
}

flushswap() {
  sudo swapoff -a
  sudo swapon -a
}

# radio
alias siradio='mplayer http://listen.siradio.fm'

export PATH="$PATH:~/.cabal/bin"
export PATH="$PATH:~/.gem/ruby/1.9.1/bin"
