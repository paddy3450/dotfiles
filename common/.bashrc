#Patrick Wallace
# ~/.bashrc
#

#only go in if in interactive mode
[[ $- != *i* ]] && return

#setting keys to vim mode
set -o vi

#prompt
#export PS1="\[\e[36m\][\[\e[m\]\[\e[35m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\] \[\e[33m\]\W\[\e[m\]\[\e[36m\]]\[\e[m\] "
#export PS1="\[\e[36m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[33m\]\W\[\e[m\]\[\e[36m\]]\[\e[m\]\[\e[36m\]\\$\[\e[m\] "
#export PS1="\[\e[32m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[33m\]\W\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] "
export PS1="\[\e[34m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[33m\]\W\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[34m\]\\$\[\e[m\] "

#tab complete after sudo
complete -cf sudo

#shell options
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

#aliases
alias ll='ls -alF --color=auto'
alias ls='ls -l --color=auto'
alias asdf='worms -d 100 -n 10'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias sudo='sudo '
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less
alias rr=ranger
alias pl=playerctl
alias plm="playerctl metadata"
alias uniup="rclone sync ~/Documents/2020 googledrive:UNI/2020" ## RCLONE GOOGLE DRIVE UNI WORK SYNC
alias unidown="rclone sync googledrive:UNI/2020 ~/Documents/2020"

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

