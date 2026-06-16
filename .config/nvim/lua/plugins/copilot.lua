vim.pack.add({
	"https://github.com/zbirenbaum/copilot.lua",
})

require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	panel = { enabled = false },
})
