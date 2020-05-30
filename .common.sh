#!/bin/sh

# for inclusion in other files only
# (not a script)

##################################################
# Packaging
##################################################

alias insto="sudo apt-get install"
alias instp="sudo dpkg -i"
alias totup="sudo apt-get -y update; sudo apt-get -y upgrade; sudo apt-get install -y -f; sudo apt autoremove -y; sudo apt upgrade"
alias dep="sudo apt-get install -f"


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

function setzoom() { 
	gsettings set org.gnome.desktop.interface text-scaling-factor "$@"; 
}

##################################################
# Commodities
##################################################

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
