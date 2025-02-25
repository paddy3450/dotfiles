#
# ~/.bash_profile
#

PATH=$PATH:~/.scripts
export NNN_BMS='d:~/Documents;D:~/Downloads/;p:~/Pircures;P:~/Programs;v:~/Videos;c:~/.config;C:~/Documents/code;m:/mnt/MEDIA/Media'

PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"
export npm_config_prefix="$HOME/.local"

export EDITOR=nvim
export VISUAL=nvim
export TERMCMD=cosmic-terminal
export TERMINAL=cosmic-terminal
export BROWSER=zen-browser

[[ -f ~/.bashrc ]] && . ~/.bashrc
