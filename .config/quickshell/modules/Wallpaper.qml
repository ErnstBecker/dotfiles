import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtCore
import QtQuick.Effects

WlrLayershell {
	id: wallpaper

	anchors {
		top: true
		bottom: true
		left: true
		right: true
	}

	layer: WlrLayer.Background
	exclusionMode: ExclusionMode.Ignore
	color: "transparent"

	property string imgPath: `${StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]}/.config/background`
	readonly property real maxRadius: Math.sqrt(Math.pow(width / 2, 2) + Math.pow(height / 2, 2))
	property bool transitioning: false
	property bool useA: true

	Item {
		anchors.fill: parent

		Image {
			id: imgA
			anchors.fill: parent
			fillMode: Image.PreserveAspectCrop
			cache: false
			smooth: true
			sourceSize: Qt.size(wallpaper.width, wallpaper.height)
			source: wallpaper.imgPath
			visible: true

			onStatusChanged: {
				if (!wallpaper.useA && status === Image.Ready && source !== "")
				growAnim.start()
			}
		}

		Image {
			id: imgB
			anchors.fill: parent
			fillMode: Image.PreserveAspectCrop
			cache: false
			smooth: true
			sourceSize: Qt.size(wallpaper.width, wallpaper.height)
			visible: false

			onStatusChanged: {
				if (wallpaper.useA && status === Image.Ready && source !== "")
				growAnim.start()
			}
		}

		Rectangle {
			id: maskRect
			anchors.fill: parent
			color: "transparent"
			visible: false
			layer.enabled: true

			Rectangle {
				id: circleShape
				width: 0
				height: width
				radius: width / 2
				color: "white"
				anchors.centerIn: parent
			}
		}

		MultiEffect {
			anchors.fill: parent
			source: wallpaper.useA ? imgB : imgA
			maskEnabled: true
			maskSource: maskRect
			maskThresholdMin: 0.5
			maskSpreadAtMin: 1.0
			visible: wallpaper.transitioning
		}

		NumberAnimation {
			id: growAnim
			target: circleShape
			property: "width"
			from: 0
			to: wallpaper.maxRadius * 2
			duration: 1000
			easing.type: Easing.OutCubic

			onStarted: wallpaper.transitioning = true

			onFinished: {
				var next = wallpaper.useA ? imgB : imgA
				var current = wallpaper.useA ? imgA : imgB
				next.visible = true
				current.visible = false
				current.source = ""
				circleShape.width = 0
				wallpaper.transitioning = false
				wallpaper.useA = !wallpaper.useA
				gc()
			}
		}
	}

	FileView {
		id: fileWatcher
		path: wallpaper.imgPath
		watchChanges: true

		onFileChanged: {
			var next = wallpaper.useA ? imgB : imgA
			next.source = ""
			next.source = wallpaper.imgPath
		}
	}
}
