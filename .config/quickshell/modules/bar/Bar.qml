import Quickshell
import QtQuick
import "components"

PanelWindow {
	id: bar
	anchors { top: true; left: true; right: true }
	implicitHeight: 26
	color: root.theme.bgcolor

	Clock {
		anchors.centerIn: parent
	}

	Battery {
		anchors { right: parent.right; verticalCenter: parent.verticalCenter; rightMargin: root.fontsize / 2 }
		showPercent: true
	}
}
