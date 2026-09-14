-- █░▄░█ █ █▄░█ █▀▄ █▀█ █░▄░█ █▀▀   █▀▄ █░█ █░░ █▀▀ █▀▀
-- █▀ ▀█ █ █░▀█ █▄▀ █▄█ █▀ ▀█ ▄▄█   █▀▄ █▄█ █▄▄ ██▄ ▄▄█

hl.window_rule({
	name  = "fix-xwayland-drags",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true
})

hl.window_rule({
	name    = "vscode-opacity",
	match   = { class = "^code$" },
	opacity = "0.98 override"
})

hl.window_rule({
	name  = "steam-friends",
	match = {
		initial_class = "^steam$",
		initial_title = "^Friends List$",
	},
	size  = "400 700",
	float = true
})
