#!/usr/bin/env bash

entries=" ⇠  Suspend\n 󰑙  Reboot\n ⏻  Poweroff\n 󰌾  Lock"

selected=$(echo -e "$entries"|wofi --dmenu --conf=/home/max/.config/hypr/modules/wofi/powermenu.config --style=/home/max/.config/hypr/modules/wofi/powermenu-style.css | awk '{print tolower($2)}')

case $selected in
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  poweroff)
    exec systemctl poweroff;;
  lock)
    exec hyprlock;;
esac
