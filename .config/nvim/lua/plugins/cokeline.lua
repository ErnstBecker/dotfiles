return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"DaikyXendo/nvim-material-icon",
		"stevearc/resession.nvim"
	},
	config = function()
		local cokeline = require("cokeline")

		cokeline.setup({})
	end
}
