#!/bin/sh

# for inclusion in other files only
# (not a script)

##################################################
# Packaging
##################################################

alias insto="yay -S"
alias totup="yay -Syu"

##################################################
# System shortcuts
##################################################

alias op="xdg-open"
alias temp="cat /sys/class/thermal/thermal_zone*/temp"
alias batt="cat /sys/class/power_supply/BAT0/capacity"

brigh () {
  cur=$(cat /sys/class/backlight/intel_backlight/brightness)
  if [ "$#" -eq 0 ]; then
	integer res=$((rint($(echo "($cur / $max) * 100" | bc -l))))
    echo $res
  else
    max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    integer res=$((rint($(echo "($max / 100) * $1" | bc -l))))
    sudo -- sh -c "echo $res > /sys/class/backlight/intel_backlight/brightness"
  fi
}

##################################################
# Commodities
##################################################
 
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

# shortcuts for simple terminal system management
alias tgmain="telegram-desktop -workdir /home/b1z0n/.local/share/TelegramDesktop/main -- %u"
alias tgtrash="telegram-desktop -workdir /home/b1z0n/.local/share/TelegramDesktop/trash -- %u"

# to backup configuration dotfiles
alias dotconf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
