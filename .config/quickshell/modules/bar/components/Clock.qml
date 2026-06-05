import QtQuick

Text {
	id: clock
	font { pixelSize: root.fontsize; bold: true }
	text: Qt.formatDateTime(new Date(), root.timeformat)
	color: root.theme.fgcolor

	Timer {
		id: clockTimer
		interval: 1000
		running: true
		repeat: true
		onTriggered: parent.text = Qt.formatDateTime(new Date(), root.timeformat)
	}

	onVisibleChanged: clockTimer.running = visible
}
