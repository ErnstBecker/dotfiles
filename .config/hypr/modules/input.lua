-- █ █▄░█ █▀█ █░█ ▀█▀
-- █ █░▀█ █▀▀ █▄█ ░█░

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "intl",
		kb_options = "caps:escape",

		follow_mouse = 1,
		force_no_accel = true,

		touchpad = {
			natural_scroll = false,
		},
	},

	cursor = {
		no_hardware_cursors = 1,
	},
})

hl.device({
	name = "realtek m700 8k 2.4g",
	sensitivity = 0,
})
