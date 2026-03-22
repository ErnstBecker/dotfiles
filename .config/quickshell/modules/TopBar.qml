import Quickshell
import QtQuick
import "topbar"

PanelWindow {
	id: topbar
	anchors { top: true; left: true; right: true }
	height: 26
	color: root.bgcolor

	Clock {
		anchors.centerIn: parent
	}
}
