import ".."

Keybinds {
	required property var target

	bindings: [
		{ sequence: "Escape", onTriggered: () => target.visible = false },

		{ sequence: "Return", onTriggered: () => target.launchSelected() },
		{ sequence: "Enter", onTriggered: () => target.launchSelected() },
		{ sequence: "Ctrl+J", onTriggered: () => target.launchSelected() },
		{ sequence: "Ctrl+M", onTriggered: () => target.launchSelected() },
		// Down selection
		{ sequence: "Tab", onTriggered: () => target.moveSelection(1) },
		{ sequence: "Ctrl+N", onTriggered: () => target.moveSelection(1) },
		// Up selection
		{ sequence: "Shift+Tab", onTriggered: () => target.moveSelection(-1) },
		{ sequence: "Ctrl+P", onTriggered: () => target.moveSelection(-1) },
		// Toggle modes
		{ sequence: "Ctrl+Tab", onTriggered: () => target.moveMode(1) },
		{ sequence: "Ctrl+L", onTriggered: () => target.moveMode(1) },
		{ sequence: "Ctrl+Shift+Tab", onTriggered: () => target.moveMode(-1) },
		{ sequence: "Ctrl+H", onTriggered: () => target.moveMode(-1) }
	]
}
