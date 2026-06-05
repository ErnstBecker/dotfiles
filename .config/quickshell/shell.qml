import Quickshell
import QtQuick
import "modules"

ShellRoot {
	id: root
	property QtObject theme: Kanagawa {}
	property int fontsize: 16
	property string timeformat: "MMM dd  hh:mm A"

	Wallpaper {}
	Bar {}
}
