vim.pack.add { "https://github.com/nvim-lualine/lualine.nvim" }

require("lualine").setup({
	options = {
		theme = "auto"
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { "diagnostics" },

		lualine_x = {
			"filetype",
		},

		lualine_y = { "progress" },
		lualine_z = { "location" },
	}
})
