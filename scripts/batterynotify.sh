#!/bin/sh
bat=$(ls -d /sys/class/power_supply/BAT* | head -n1)
cap=$(cat "$bat/capacity")
status=$(cat "$bat/status")
notify-send -t 3000 -h string:x-canonical-private-synchronous:battery "Battery" "${cap}% (${status})"
