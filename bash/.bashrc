#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1 '[\u@\h \W]\$ '
[ -r /home/ismail/.config/byobu/prompt ] && . /home/ismail/.config/byobu/prompt   #byobu-prompt#
export EDITOR=nvim


. "$HOME/.cargo/env"

export PATH=$PATH:/home/ismail/.spicetify
alias apostrophe="GTK_THEME=Adwaita-dark apostrophe"
