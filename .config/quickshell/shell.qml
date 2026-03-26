import Quickshell
import QtQuick
import "modules"

ShellRoot {
	id: root
	property color dark: "#000"
	property color light: "#fff"
	property color bgcolor: dark
	property color fgcolor: "#d2d2d2"
	property color accentcolor: "#ff0043"
	property int fontsize: 16
	property string timeformat: "dd 'of' MMM  HH:mm"

	Wallpaper {}
	Bar {}
}
