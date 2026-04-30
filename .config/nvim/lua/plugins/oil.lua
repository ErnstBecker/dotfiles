vim.pack.add({
	"https://github.com/stevearc/oil.nvim"
})
require("oil").setup({
	keymaps = {
		["s"] = "actions.select",
		["h"] = "actions.toggle_hidden",
		["<C-s>"] = { "actions.parent", mode = "n" },
	},
})
