pragma ComponentBehavior: Bound

import ".."
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtCore

PanelWindow {
	id: launcher

	visible: false
	focusable: true
	color: "transparent"
	exclusionMode: ExclusionMode.Ignore
	WlrLayershell.layer: WlrLayer.Overlay
	WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

	readonly property int panelWidth: 600
	readonly property int headerHeight: 180
	readonly property int rowHeight: 44
	readonly property int maxRows: 5
	readonly property int listPadding: 20
	readonly property int listSpacing: 10
	readonly property int listAreaHeight: listPadding * 2 + maxRows * rowHeight + (maxRows - 1) * listSpacing
	readonly property int panelHeight: headerHeight + listAreaHeight
	readonly property int cornerRadius: 6

	implicitWidth: panelWidth
	implicitHeight: panelHeight

	readonly property color bg: root.theme.bgcolor
	readonly property color fg: root.theme.fgcolor
	readonly property color accent: root.theme.accentcolor
	// Same as `bg`, on purpose: rofi_theme.rasi uses one flat color for both the
	// window and its pills (entry, prompt icon, mode buttons) -- they only read
	// as separate shapes against the wallpaper header behind them.
	readonly property color bgAlt: bg

	readonly property string wallpaperPath: `${StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]}/.config/background`

	FileView {
		id: usageFile
		path: `${StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]}/.cache/quickshell-launcher-usage.json`
		onLoadFailed: error => {
			if (error === FileViewError.FileNotFound)
				usageFile.writeAdapter()
		}

		JsonAdapter {
			id: usageAdapter
			property var counts: ({})
		}
	}

	function recordLaunch(id) {
		usageAdapter.counts[id] = (usageAdapter.counts[id] || 0) + 1
		usageFile.writeAdapter()
	}

	property var modes: [
		{
			name: "Apps",
			icon: "",
			placeholder: "Search...",
			results: function (query) {
				const q = query.toLowerCase()
				const has = s => s.toLowerCase().includes(q)
				const count = e => usageAdapter.counts[e.id] || 0
				return DesktopEntries.applications.values
					.filter(e => !e.noDisplay && (has(e.name) || has(e.genericName) || e.keywords.some(has)))
					// Name matches rank above genericName/keyword-only matches
					.sort((a, b) => has(b.name) - has(a.name)
						|| count(b) - count(a)
						|| a.name.localeCompare(b.name))
			},
			activate: function (entry) {
				launcher.recordLaunch(entry.id)
				entry.execute()
			}
		},
		{
			name: "Run",
			icon: "",
			placeholder: "Run command...",
			results: function (query) {
				if (!query)
					return []
				return [{ id: "run:" + query, name: query, icon: "utilities-terminal" }]
			},
			activate: function (entry) {
				Quickshell.execDetached(["sh", "-c", entry.name])
			}
		}
	]
	property int activeMode: 0
	property var results: modes[activeMode].results(searchField.text)
	property int selectedIndex: 0
	property int scrollOffset: 0
	property var visibleResults: results.slice(scrollOffset, scrollOffset + maxRows)

	onVisibleChanged: {
		if (visible) {
			// Reload the wallpaper on open instead of watching the file
			wallpaperImage.source = ""
			wallpaperImage.source = wallpaperPath
			activeMode = 0
			searchField.text = ""
			selectedIndex = 0
			scrollOffset = 0
			searchField.forceActiveFocus()
		}
	}

	onResultsChanged: {
		selectedIndex = 0
		scrollOffset = 0
	}

	function launchSelected() {
		const entry = results[selectedIndex]
		if (!entry)
			return
		modes[activeMode].activate(entry)
		launcher.visible = false
	}

	function moveSelection(delta) {
		selectedIndex = Math.max(0, Math.min(selectedIndex + delta, results.length - 1))
		if (selectedIndex < scrollOffset)
			scrollOffset = selectedIndex
		else if (selectedIndex >= scrollOffset + maxRows)
			scrollOffset = selectedIndex - maxRows + 1
	}

	function moveMode(delta) {
		activeMode = (activeMode + delta + modes.length) % modes.length
	}

	IpcHandler {
		target: "launcher"

		function toggle(): void { launcher.visible = !launcher.visible }
		function show(): void { launcher.visible = true }
		function hide(): void { launcher.visible = false }
	}

	LauncherKeybinds {
		target: launcher
	}

	ClippingRectangle {
		id: box
		anchors.centerIn: parent
		width: launcher.panelWidth
		height: launcher.panelHeight
		radius: launcher.cornerRadius
		color: launcher.bg

		ColumnLayout {
			id: mainLayout
			anchors.fill: parent
			spacing: 0

			Item {
				id: header
				Layout.fillWidth: true
				Layout.preferredHeight: launcher.headerHeight

				Image {
					id: wallpaperImage
					anchors.fill: parent
					fillMode: Image.PreserveAspectCrop
					cache: false
					smooth: true
					asynchronous: true
					source: launcher.wallpaperPath
					sourceSize: Qt.size(launcher.panelWidth, launcher.headerHeight)
				}

				Rectangle {
					anchors.fill: parent
					color: launcher.bg
					opacity: 0.35
				}

				RowLayout {
					anchors.fill: parent
					anchors.topMargin: 68
					anchors.bottomMargin: 68
					anchors.leftMargin: 40
					anchors.rightMargin: 40
					spacing: 10

					Rectangle {
						implicitWidth: 44
						implicitHeight: 44
						radius: width / 2
						color: launcher.bgAlt

						Text {
							anchors.centerIn: parent
							text: ""
							font.family: root.fontfamily
							font.pixelSize: 16
							color: launcher.fg
						}
					}

					Rectangle {
						implicitWidth: 250
						implicitHeight: 44
						radius: height / 2
						color: launcher.bgAlt

						TextInput {
							id: searchField
							anchors.fill: parent
							anchors.leftMargin: 15
							anchors.rightMargin: 15
							verticalAlignment: TextInput.AlignVCenter
							color: launcher.fg
							font.family: root.fontfamily
							font.pixelSize: 14
							font.bold: true
							clip: true
							selectByMouse: true

							Window.onActiveChanged: Window.active ? focusLossTimer.stop() : focusLossTimer.restart()

							Timer {
								id: focusLossTimer
								interval: 150
								onTriggered: if (!searchField.Window.active) launcher.visible = false
							}

							Text {
								anchors.verticalCenter: parent.verticalCenter
								text: launcher.modes[launcher.activeMode].placeholder
								color: Qt.rgba(1, 1, 1, 0.4)
								font: searchField.font
								visible: !searchField.text.length
							}

						}
					}

					Item { Layout.fillWidth: true }

					RowLayout {
						spacing: 10

						Repeater {
							model: launcher.modes

							Rectangle {
								required property var modelData
								required property int index

								implicitWidth: 45
								implicitHeight: 44
								radius: width / 2
								color: launcher.activeMode === index ? launcher.accent : launcher.bgAlt

								Text {
									anchors.centerIn: parent
									text: parent.modelData.icon
									font.family: root.fontfamily
									font.pixelSize: 16
									color: launcher.fg
								}

								MouseArea {
									anchors.fill: parent
									onClicked: launcher.activeMode = index
								}
							}
						}
					}
				}
			}

			Rectangle {
				Layout.fillWidth: true
				Layout.fillHeight: true
				color: launcher.bg

				Item {
					anchors.fill: parent
					anchors.margins: launcher.listPadding
					clip: true

					Text {
						anchors.centerIn: parent
						visible: launcher.results.length === 0
						text: "No results"
						color: launcher.fg
						font.family: root.fontfamily
						font.pixelSize: 14
					}

					Column {
						width: parent.width
						spacing: launcher.listSpacing

						Repeater {
							model: launcher.visibleResults

							Rectangle {
								id: row
								required property var modelData
								required property int index
								readonly property int absoluteIndex: index + launcher.scrollOffset

								width: parent.width
								height: launcher.rowHeight
								radius: height / 2
								antialiasing: true
								color: launcher.selectedIndex === absoluteIndex ? launcher.accent : "transparent"

								RowLayout {
									anchors.fill: parent
									anchors.leftMargin: 12
									anchors.rightMargin: 12
									spacing: 10

									IconImage {
										implicitSize: 32
										source: Quickshell.iconPath(row.modelData.icon, "application-x-executable")
									}

									Text {
										Layout.fillWidth: true
										text: row.modelData.name
										color: launcher.fg
										font.family: root.fontfamily
										font.pixelSize: 14
										font.bold: true
										elide: Text.ElideRight
									}
								}

								MouseArea {
									anchors.fill: parent
									hoverEnabled: true
									cursorShape: Qt.PointingHandCursor
									onEntered: launcher.selectedIndex = row.absoluteIndex
									onClicked: {
										launcher.selectedIndex = row.absoluteIndex
										launcher.launchSelected()
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
