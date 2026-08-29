#!/bin/sh

if [ -z "$1" ]; then
	echo "Use: $0 <file>"
	exit 1
fi

cp "$1" ~/.config/background

ffmpeg -y -loglevel error -i "$1" -vf "scale=800:-1" ~/.cache/rofi_background.png

if pgrep -x awww-daemon > /dev/null 2>&1; then
	awww img --transition-fps=180 --transition-type=grow --transition-pos=center --transition-duration=1 ~/.config/background
fi
