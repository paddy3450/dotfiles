#Patrick Wallace
# ~/.bashrc
#

#only go in if in interactive mode
[[ $- != *i* ]] && return

#setting keys to vim mode
set -o vi

#prompt
export PS1="\[\e[34m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[33m\]\W\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[34m\]\\$\[\e[m\] "

export EDITOR=nvim
export VISUAL=nvim

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
alias mv="mv -i"                          # confirm before overwriting something
alias rm="rm -i"                          # confirm before removing something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less
alias rr=ranger
alias nn="nnn -ed"
alias pl=playerctl
alias plm="playerctl metadata"
alias uniup="rclone sync ~/Documents/2021 googledrive:UNI/2021" ## RCLONE GOOGLE DRIVE UNI WORK SYNC
alias unidown="rclone sync googledrive:UNI/2021 ~/Documents/2021"
alias unicheck="rclone check googledrive:UNI/2021 ~/Documents/2021"
alias uniup2020="rclone sync ~/Documents/2020 googledrive:UNI/2020" ## RCLONE GOOGLE DRIVE UNI WORK SYNC
alias unidown2020="rclone sync googledrive:UNI/2020 ~/Documents/2020"
alias unicheck2020="rclone check googledrive:UNI/2020 ~/Documents/2020"
alias g="git"
alias gs="git status"
alias gb="git branch"
alias gl="git log --oneline"
alias ga="git add"
alias gc="git commit -m"
alias texsnips="vim -O ~/.vim/UltiSnips/tex.snippets ~/.vim/UltiSnips/tex.snippets.castel"
alias ltuvpn="sudo f5fpc --start -t connect.latrobe.edu.au -u 'STUDENTS\18918787' -p "
alias mlab="wmname LG3D;matlab -nodesktop -nosplash; wmname dwm"


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

