pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

RowLayout {
	id: volume
	spacing: 8

	property int ttl: 1500
	property int barWidth: 120
	property int barHeight: 8
	property color trackColor: root.theme.bgcolor
	property color fillColor: root.theme.fgcolor
	property color accentColor: root.theme.accentcolor
	property color mutedColor: root.theme.error
	property color iconColor: root.theme.fgcolor
	property real maxLevel: 1.25

	readonly property var sink: Pipewire.defaultAudioSink
	readonly property real level: sink && sink.audio ? sink.audio.volume : 0
	readonly property bool muted: sink && sink.audio ? sink.audio.muted : false

	property bool active: false
	property bool initialized: false
	visible: active

	onSinkChanged: { initialized = false; initTimer.restart() }
	Component.onCompleted: initTimer.restart()

	Timer {
		id: initTimer
		interval: 400
		onTriggered: volume.initialized = true
	}

	function iconFor() {
		if (volume.muted || volume.level <= 0)
			return "󰝟"
		if (volume.level < 0.34)
			return "󰕿"
		if (volume.level < 0.67)
			return "󰖀"
		return "󰕾"
	}

	PwObjectTracker {
		objects: volume.sink ? [volume.sink] : []
	}

	Connections {
		target: volume.sink ? volume.sink.audio : null
		function onVolumeChanged() { volume.trigger() }
		function onMutedChanged() { volume.trigger() }
	}

	function trigger() {
		if (!volume.initialized)
			return
		volume.active = true
		ttlTimer.restart()
	}

	Timer {
		id: ttlTimer
		interval: volume.ttl
		onTriggered: volume.active = false
	}

	Text {
		Layout.alignment: Qt.AlignVCenter
		Layout.preferredWidth: root.fontsize
		horizontalAlignment: Text.AlignLeft
		text: volume.iconFor()
		color: volume.muted ? volume.mutedColor : volume.iconColor
		font { family: root.fontfamily; pixelSize: root.fontsize; bold: true }
	}

	Rectangle {
		id: track
		Layout.alignment: Qt.AlignVCenter
		implicitWidth: volume.barWidth
		implicitHeight: volume.barHeight
		radius: height / 2
		color: volume.trackColor
		clip: true

		Rectangle {
			id: fill
			anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
			width: Math.max(track.radius * 2, Math.min(track.width, track.width * volume.level / volume.maxLevel))
			radius: track.radius
			color: volume.mutedColor
			visible: volume.muted

			Behavior on width {
				NumberAnimation { duration: 150; easing.type: Easing.OutQuad }
			}
		}

		Rectangle {
			id: baseFill
			anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
			width: Math.max(track.radius * 2, track.width * Math.min(volume.level, 1.0) / volume.maxLevel)
			topLeftRadius: track.radius
			bottomLeftRadius: track.radius
			topRightRadius: volume.level > 1.0 ? 0 : track.radius
			bottomRightRadius: volume.level > 1.0 ? 0 : track.radius
			color: volume.fillColor
			visible: !volume.muted

			Behavior on width {
				NumberAnimation { duration: 150; easing.type: Easing.OutQuad }
			}
		}

		Rectangle {
			anchors { left: baseFill.right; top: parent.top; bottom: parent.bottom }
			width: volume.level > 1.0 ? track.width * (Math.min(volume.level, volume.maxLevel) - 1.0) / volume.maxLevel : 0
			topLeftRadius: 0
			bottomLeftRadius: 0
			topRightRadius: track.radius
			bottomRightRadius: track.radius
			color: volume.accentColor
			visible: !volume.muted && volume.level > 1.0
		}

		Rectangle {
			id: limitMarker
			anchors { top: parent.top; bottom: parent.bottom }
			x: track.width / volume.maxLevel - width / 2
			width: 2
			color: "white"
			opacity: 0.35
		}
	}
}
