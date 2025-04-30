#!/usr/bin/env bash

entries="⇠  Suspend\n󰑙  Reboot\n⏻  Poweroff\n󰌾  Lock\n⇠  Hibernate"

selected=$(echo -e "$entries" | wofi --dmenu --width=420 --height=265 | awk '{print tolower($2)}')

case $selected in
  poweroff)
    exec systemctl poweroff;;
  reboot)
    exec systemctl reboot;;
  lock)
    exec hyprlock;;
  suspend)
    exec systemctl suspend;;
  hibernate)
    exec systemctl hibernate;;
esac
