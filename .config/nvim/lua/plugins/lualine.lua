return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto"
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },

				lualine_x = {
					"diagnostics",
					"fileformat",
					"filetype",
				},

				lualine_y = { "progress" },
				lualine_z = { "location" },
			}
		})
	end
}
