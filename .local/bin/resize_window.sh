#!/bin/sh

was_floating=$(hyprctl activewindow -j | jq -r '.floating')

hyprctl dispatch 'hl.dsp.window.float()'

if [ "$was_floating" = "false" ]; then
	hyprctl dispatch 'hl.dsp.window.resize({ x = 800, y = 500, relative = false })'
	hyprctl dispatch 'hl.dsp.window.center()'
fi
