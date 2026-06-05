import Quickshell.Io
import QtQuick

Item {
	id: battery
	implicitWidth: iconText.implicitWidth + 4 + pctText.implicitWidth
	implicitHeight: Math.max(iconText.implicitHeight, pctText.implicitHeight)

	readonly property string iconFull: "\uF240"
	readonly property string iconThreeQuarters: "\uF241"
	readonly property string iconHalf: "\uF242"
	readonly property string iconQuarter: "\uF243"
	readonly property string iconEmpty: "\uF244"

	property color batColor: root.theme.fgcolor

	Text {
		id: iconText
		font { pixelSize: root.fontsize; bold: true }
		color: battery.batColor
		anchors.verticalCenter: parent.verticalCenter
	}

	Text {
		id: pctText
		font { pixelSize: root.fontsize - 4; bold: true }
		color: battery.batColor
		anchors { verticalCenter: parent.verticalCenter; verticalCenterOffset: 1; left: iconText.right; leftMargin: 4 }
	}

	function batteryIcon(pct) {
		if (pct >= 90) return iconFull
		if (pct >= 75) return iconThreeQuarters
		if (pct >= 50) return iconHalf
		if (pct >= 25) return iconQuarter
		return iconEmpty
	}

	FileView {
		id: uevent
		path: "/sys/class/power_supply/BAT0/uevent"
		preload: true
		onLoaded: updateBattery()
	}

	Timer {
		interval: 1000
		running: true
		repeat: true
		onTriggered: uevent.reload()
	}

	function updateBattery() {
		var raw = uevent.__text || ""
		var pct = 0
		var status = ""
		var present = false

		var lines = raw.split("\n")
		for (var i = 0; i < lines.length; i++) {
			var line = lines[i].trim()
			if (line.indexOf("POWER_SUPPLY_PRESENT=1") === 0)
				present = true
			else if (line.indexOf("POWER_SUPPLY_CAPACITY=") === 0)
				pct = parseInt(line.substring("POWER_SUPPLY_CAPACITY=".length))
			else if (line.indexOf("POWER_SUPPLY_STATUS=") === 0)
				status = line.substring("POWER_SUPPLY_STATUS=".length)
		}

		if (!present) {
			iconText.text = ""
			pctText.text = ""
			return
		}

		iconText.text = batteryIcon(pct)
		pctText.text = `${pct}%`

		if (status === "Charging")
			batColor = root.theme.positivecolor
		else if (pct > 35)
			batColor = root.theme.fgcolor
		else if (pct > 25)
			batColor = "#FFD700"
		else
			batColor = root.theme.accentcolor
	}
}
