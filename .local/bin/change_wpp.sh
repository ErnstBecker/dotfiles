#!/bin/sh

if [ -z "$1" ]; then
    echo "Use: $0 <file>"
    exit 1
fi

cp "$1" ~/.config/background

swww img --transition-fps=180 --transition-type=grow --transition-pos=center --transition-duration=1 ~/.config/background
