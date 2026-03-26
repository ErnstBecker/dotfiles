import Quickshell
import QtQuick
import "components"

PanelWindow {
	id: bar
	anchors { top: true; left: true; right: true }
	implicitHeight: 26
	color: root.bgcolor

	Clock {
		anchors.centerIn: parent
	}
}
