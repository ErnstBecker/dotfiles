#!/bin/sh

was_floating=$(hyprctl activewindow -j | jq -r '.floating')

hyprctl dispatch togglefloating

if [ "$was_floating" = "false" ]; then
	hyprctl dispatch resizeactive exact 800 500
	hyprctl dispatch centerwindow
fi
