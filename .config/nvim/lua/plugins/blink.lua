return {
	"saghen/blink.cmp",
	version = "1.*",
	build = "cargo build --release",
	opts = {
		keymap = { preset = "default" },
		sources = {
			default = { "lsp", "snippets", "path", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
			},
		},
		signature = { enabled = true }
	},
	opts_extend = { "sources.default" },
}
