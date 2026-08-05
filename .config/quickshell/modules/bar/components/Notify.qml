pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications
import Quickshell.Hyprland

RowLayout {
	id: notify
	spacing: 8

	property int ttl: 7000
	property string icon: "󰂚"
	property color iconColor: root.theme.accentcolor
	property color textColor: root.theme.fgcolor
	property int maxTextWidth: 260
	property bool showBody: true

	property var active: null
	readonly property bool hasNotification: active !== null

	visible: hasNotification

	function caseInsensitiveRegex(str) {
		return str.replace(/[a-zA-Z]/g, function (c) {
			return "[" + c.toLowerCase() + c.toUpperCase() + "]"
		})
	}

	function focusSender() {
		if (!notify.active || !notify.active.desktopEntry)
			return
		var pattern = notify.caseInsensitiveRegex(notify.active.desktopEntry)
		Hyprland.dispatch("hl.dsp.focus({ window = \"class:^(" + pattern + ")$\" })")
	}

	function hide(dismissedByUser) {
		if (!notify.active)
			return
		if (dismissedByUser)
			notify.active.dismiss()
		else
			notify.active.expire()
	}

	NotificationServer {
		id: server
		keepOnReload: false
		bodySupported: true
		imageSupported: true

		onNotification: (notification) => {
			if (notify.active) {
				var old = notify.active
				old.expire()
				// onClosed may have already cleaned this up synchronously
				if (notify.active === old) {
					notify.active = null
					old.tracked = false
				}
			}
			notification.tracked = true
			notify.active = notification
			ttlTimer.restart()
		}
	}

	Timer {
		id: ttlTimer
		interval: notify.ttl
		onTriggered: notify.hide(false)
	}

	Connections {
		target: notify.active
		function onClosed(reason) {
			var n = notify.active
			notify.active = null
			if (n)
				n.tracked = false
		}
	}

	Text {
		Layout.alignment: Qt.AlignVCenter
		text: notify.icon
		color: notify.iconColor
		font { family: root.fontfamily; pixelSize: root.fontsize; bold: true }
	}

	Text {
		id: bodyText
		Layout.alignment: Qt.AlignVCenter
		Layout.maximumWidth: notify.maxTextWidth
		text: {
			if (!notify.active)
				return ""
			var body = notify.showBody ? notify.active.body : ""
			return body ? notify.active.summary + ": " + body : notify.active.summary
		}
		color: notify.textColor
		font { family: root.fontfamily; pixelSize: root.fontsize - 2; bold: true }
		elide: Text.ElideRight

		MouseArea {
			anchors.fill: parent
			cursorShape: Qt.PointingHandCursor
			onClicked: {
				notify.focusSender()
				notify.hide(true)
			}
		}
	}
}
