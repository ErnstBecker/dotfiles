pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import "components"

PanelWindow {
	id: bar
	anchors { top: true; left: true; right: true }

	// Properties
	property bool fill
	property int barHeight
	property int topGap: 0
	property int topRounding
	property int botRounding
	property bool clockMode: false

	color: fill ? root.theme.bgcolor : "transparent"


	implicitHeight: barHeight

	Rectangle {
		id: island

		anchors { top: parent.top; topMargin: bar.topGap; horizontalCenter: parent.horizontalCenter }
		implicitHeight: bar.barHeight
		implicitWidth: content.implicitWidth + 28
		topLeftRadius: bar.topRounding; topRightRadius: bar.topRounding
		bottomLeftRadius: bar.botRounding; bottomRightRadius: bar.botRounding
		color: root.theme.bgcolor

		property real dragX: dragHandler.active ? Math.max(-40, Math.min(40, dragHandler.translation.x * 0.4)) : 0
		transform: Translate { x: island.dragX }

		Behavior on implicitWidth {
			NumberAnimation { duration: 220; easing.type: Easing.OutExpo }
		}

		Behavior on dragX {
			enabled: !dragHandler.active
			NumberAnimation { duration: 250; easing.type: Easing.OutBack }
		}

		DragHandler {
			id: dragHandler
			target: null
			enabled: media.active || bar.clockMode
			yAxis.enabled: false
			dragThreshold: 36

			onActiveChanged: {
				if (!active)
					bar.clockMode = !bar.clockMode
			}
		}

		RowLayout {
			id: content
			anchors.centerIn: parent
			spacing: 12

			Notify {
				id: notify
			}

			RowLayout {
				visible: !notify.hasNotification
				spacing: 12

				Clock {
					id: clock
					visible: bar.clockMode || !media.active
				}

				Media {
					id: media
					elementSize: bar.barHeight
					visible: !bar.clockMode && active
				}
			}
		}
	}
}
