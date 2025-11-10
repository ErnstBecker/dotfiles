return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"stevearc/resession.nvim"
	},
	config = function()
		local cokeline = require("cokeline")

		cokeline.setup({})
	end
}
