#
# ~/.bash_profile
#

PATH=$PATH:~/.scripts
export NNN_BMS='d:~/Documents;D:~/Downloads/;u:~/Documents/2021;p:~/Pircures;P:~/Programs;v:~/Videos;c:~/.config'

PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix="$HOME/.local"

[[ -f ~/.bashrc ]] && . ~/.bashrc
