import Quickshell
import QtQuick
import "modules"

ShellRoot {
	id: root
	property color bgcolor: "#000"
	property color fgcolor: "#d2d2d2"
	property color accentcolor: "#ff0043"
	property int fontsize: 16
	property string timeformat: "MMM/dd/yy - HH:mm"

	TopBar {}
}
