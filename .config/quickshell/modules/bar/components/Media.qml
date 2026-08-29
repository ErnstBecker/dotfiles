pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import Quickshell.Hyprland

RowLayout {
	id: media

	readonly property string iconPrev: ""
	readonly property string iconPlay: ""
	readonly property string iconPause: ""
	readonly property string iconNext: ""

	property int elementSize: 0
	property int maxTitleWidth: 300
	property int playButtonSize: elementSize * 0.7
	property int controlButtonSize: elementSize * 0.3
	property int dividerGap: 12

	readonly property var players: Mpris.players ? Mpris.players.values : []
	readonly property var spotifyPlayer: players.find(p => (p.desktopEntry || "").toLowerCase() === "spotify") || null
	readonly property var player: media.spotifyPlayer || players.find(p => p.isPlaying) || players[0] || null
	readonly property bool active: player !== null

	visible: active

	function togglePlay() {
		if (!player)
			return
		if (player.canTogglePlaying) {
			player.togglePlaying()
		} else if (player.isPlaying) {
			player.pause()
		} else {
			player.play()
		}
	}

	function goPrevious() {
		if (player) player.previous()
	}

	function goNext() {
		if (player) player.next()
	}

	function caseInsensitiveRegex(str) {
		return str.replace(/[a-zA-Z]/g, function (c) {
			return "[" + c.toLowerCase() + c.toUpperCase() + "]"
		})
	}

	function focusPlayerWindow() {
		if (!player)
			return
		var cls = player.desktopEntry || "spotify"
		var pattern = media.caseInsensitiveRegex(cls)
		Hyprland.dispatch("hl.dsp.focus({ window = \"class:^(" + pattern + ")$\" })")
	}

	component ControlButton: Rectangle {
		id: control
		property string icon
		property bool available: true
		property bool accent: false
		signal activated()

		Layout.alignment: Qt.AlignVCenter
		implicitWidth: control.accent ? media.playButtonSize : media.controlButtonSize
		implicitHeight: implicitWidth
		radius: width / 2
		color: control.accent
			? (area.containsMouse ? Qt.lighter(root.theme.accentcolor, 1.3) : root.theme.accentcolor)
			: (area.containsMouse ? Qt.lighter(root.theme.bgcolor, 2.4) : "transparent")

		Behavior on color {
			ColorAnimation { duration: 120 }
		}

		Text {
			anchors.fill: parent
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			text: control.icon
			color: control.accent ? root.theme.bgcolor : (control.available ? root.theme.fgcolor : Qt.darker(root.theme.fgcolor, 1.8))
			font { family: root.fontfamily; pixelSize: (control.accent ? media.playButtonSize * 0.5 : media.controlButtonSize * 1.8); bold: true }
		}

		MouseArea {
			id: area
			anchors.fill: parent
			hoverEnabled: true
			cursorShape: Qt.PointingHandCursor
			onClicked: control.activated()
		}
	}

	ControlButton {
		id: prevButton
		icon: media.iconPrev
		available: media.player && media.player.canGoPrevious
		onActivated: media.goPrevious()
	}

	ControlButton {
		id: playButton
		accent: true
		icon: media.player && media.player.isPlaying ? media.iconPause : media.iconPlay
		onActivated: media.togglePlay()
	}

	ControlButton {
		id: nextButton
		icon: media.iconNext
		available: media.player && media.player.canGoNext
		onActivated: media.goNext()
	}

	Rectangle {
		id: divider
		visible: media.player && (media.player.isPlaying || media.player.trackTitle.length > 0)
		Layout.alignment: Qt.AlignVCenter
		Layout.leftMargin: media.dividerGap
		Layout.rightMargin: media.dividerGap
		implicitWidth: 1
		implicitHeight: media.controlButtonSize * 2.64
		color: root.theme.fgcolor
		opacity: 0.25
	}

	Text {
		id: titleText
		Layout.alignment: Qt.AlignVCenter
		Layout.maximumWidth: media.maxTitleWidth
		elide: Text.ElideRight
		text: {
			if (!media.player)
				return ""
			var artist = media.player.trackArtist
			var title = media.player.trackTitle
			return artist ? artist + " – " + title : title
		}
		color: root.theme.fgcolor
		font { family: root.fontfamily; pixelSize: root.fontsize - 2; bold: true }

		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			cursorShape: Qt.PointingHandCursor
			acceptedButtons: Qt.MiddleButton
			onClicked: mouse => {
				if (mouse.button === Qt.MiddleButton)
					media.focusPlayerWindow()
			}
		}
	}
}
