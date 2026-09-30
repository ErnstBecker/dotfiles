import QtQuick
import QtQml.Models

// Declarative keybinds for whichever window this is instantiated in --
// Shortcut's default context scopes each binding to that window, so dropping
// this into a different module's window scopes it there instead.
//
// Usage:
//   Keybinds {
//       bindings: [
//           { sequence: "Ctrl+J", onTriggered: () => doThing() },
//       ]
//   }
Item {
	id: root

	property var bindings: []

	visible: false

	Instantiator {
		model: root.bindings

		delegate: Shortcut {
			required property var modelData

			sequence: modelData.sequence
			onActivated: modelData.onTriggered()
		}
	}
}
