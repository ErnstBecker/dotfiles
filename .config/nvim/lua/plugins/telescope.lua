vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").setup({
	defaults = {
		hidden = true,
		file_ignore_patterns = {
			"%.git/",
			"%.vscode/",
			"^target/",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

require("telescope").load_extension("ui-select")
