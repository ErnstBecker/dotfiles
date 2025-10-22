#!/bin/sh

dir="$HOME/.config/rofi/"
theme='rofi_theme'

## Run
rofi \
	-show drun \
	-theme ${dir}/${theme}.rasi
