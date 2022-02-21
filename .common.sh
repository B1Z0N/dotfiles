#!/bin/sh

# for inclusion in other files only
# (not a script)


##################################################
# System shortcuts
##################################################

alias op="xdg-open"
alias temp="cat /sys/class/thermal/thermal_zone*/temp"
alias batt="cat /sys/class/power_supply/BAT0/capacity"

brigh () {
  cur=$(cat /sys/class/backlight/intel_backlight/brightness)
  max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
  if [ "$#" -eq 0 ]; then
    res=$(echo "($cur / $max) * 100" | bc -l)
    echo $res | awk '{print int($1)}'
  else
    res=$(echo "($max / 100) * $1" | bc -l | awk '{print int($1)}')
    sudo sh -c "echo $res > /sys/class/backlight/intel_backlight/brightness"
  fi
}

function setzoom() { 
	gsettings set org.gnome.desktop.interface text-scaling-factor "$@"; 
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

# to backup configuration dotfiles
alias dotconf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# to enable vim mode
set -o vi
