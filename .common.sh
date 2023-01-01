#!/bin/sh

# for inclusion in other files only
# (not a script)


##################################################
# System shortcuts
##################################################

alias op="open"

##################################################
# Commodities
##################################################
 
between () { 
  cat | head -n "$2" | tail -n $(bc <<< "$2-$1+1")
}

killp () {
  if [ -z $1 ]; then
    printf "Pass it the name of process to kill\n"
    return 1
  fi

  cnt=$(ps -aux | grep "$1" | wc -l)
  if [ $cnt -eq 1 ]; then 
    printf "Already dead\n"
    return 0
  fi

  pid=$(ps -aux | grep "$1" | awk 'NR==1{print $2}')
  name=$(ps -aux | grep "$1" | awk 'NR==1{print $11}')

  printf "%s\nY or n: " "$name"
  read is_kill
  if [ -z "$is_kill" ] || [ "$is_kill" = "y" ] || [ "$is_kill" = "Y" ]; then
    sudo kill -9 "$pid"
  fi
} 

alias wowtf="echo '(╯°□°)╯︵ ┻━┻'"

cs() {
    if [ -z "$1" ]; then 
        clear && ls
    else
        clear && cd $1 && ls
    fi
}

zs() {
    if [ -z "$1" ]; then 
        clear && ls
    else
        clear && z $1 && ls
    fi
}

gs() {
  clear && git status
}

code() {
   open -a Visual\ Studio\ Code.app $1
}

# to backup configuration dotfiles
alias dotconf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# to enable vim mode
set -o vi

export PATH="/Users/b1z0n/.local/bin:$PATH"
