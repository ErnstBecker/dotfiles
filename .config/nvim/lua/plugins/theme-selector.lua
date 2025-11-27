return {
	"mrs4ndman/theme-selector.nvim",
	cmd = { "Themer" },
	config = function()
		require("theme-selector.colorschemes").list = vim.fn.getcompletion("", "color")
		require("theme-selector")
	end,
}
