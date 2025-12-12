import QtQuick
import Quickshell
import Quickshell.Io

PanelWindow {
	id: root

	anchors.top: true
	anchors.left: true
	anchors.right: true
	implicitHeight: 30
	color: root.bgcolor

	property color bgcolor: "#000"
	property color fgcolor: "#d2d2d2"
	property color accentcolor: "#ff0043"
	property int fontsize: 16
	property string timeformat: "MMM/dd/yy - HH:mm"

	Text {
		id: distro
		text: "󰣇"
		font { pixelSize: root.fontsize; bold: true }
		anchors.verticalCenter: parent.verticalCenter
		anchors.left: parent.left
		anchors.leftMargin: 10
		property bool hovering: false
		color: hovering ? root.accentcolor : root.fgcolor

		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onEntered: distro.hovering = true
			onExited: distro.hovering = false
		}
	}

	Text {
		id: clock
		anchors.centerIn: parent
		font { pixelSize: root.fontsize; bold: true }
		text: Qt.formatDateTime(new Date(), root.timeformat)
		property bool hovering: false
		color: hovering ? root.accentcolor : root.fgcolor

		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onEntered: clock.hovering = true
			onExited: clock.hovering = false
		}

		Timer {
			interval: 1000
			running: true
			repeat: true
			onTriggered: clock.text = Qt.formatDateTime(new Date(), root.timeformat)
		}
	}

	Text {
		id: shutdown
		text: "⏻"
		font { pixelSize: root.fontsize; bold: true }
		anchors.verticalCenter: parent.verticalCenter
		anchors.right: parent.right
		anchors.rightMargin: 10
		property bool hovering: false
		color: hovering ? root.accentcolor : root.fgcolor

		Process {
			id: shutdownProcess
			command: ["systemctl", "poweroff"]
		}

		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onEntered: shutdown.hovering = true
			onExited: shutdown.hovering = false
			onClicked: shutdownProcess.running = true
		}
	}
}
