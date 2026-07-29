import Quickshell
import QtQuick
import "modules"

ShellRoot {
	id: root
	property QtObject theme: Kanagawa {}
	property string fontfamily: "CaskaydiaCove Nerd Font"
	property int fontsize: 16
	property string timeformat: "MMM dd  HH:mm"

	Wallpaper {}
	DinamicIsland {
		// fill: true
		barHeight: 26
		topRounding: 0
		botRounding: 6
	}
}
