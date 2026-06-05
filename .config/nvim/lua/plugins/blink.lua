vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.0"),
	},
})

require("blink.cmp").setup({
	keymap = { preset = "none" },
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
	signature = { enabled = true },
})
