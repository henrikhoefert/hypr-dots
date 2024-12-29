#!/bin/bash

if [ -z "$( ls -A '/sys/class/power_supply' )" ]; then
	echo ""
else
	battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

	battery_status=$(cat /sys/class/power_supply/BAT0/status)

	battery_icons=("" "" "" "" "")

	icon_index=$((battery_percentage / 20))

	battery_icon=${battery_icons[icon_index]}

	charging_icon=" $battery_icon"

	if [ "$battery_status" = "Charging" ]; then
		battery_icon="$charging_icon"
	fi

	echo "$battery_icon $battery_percentage%"
fi
