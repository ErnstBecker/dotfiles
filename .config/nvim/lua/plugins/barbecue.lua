vim.pack.add ({
	"https://github.com/utilyre/barbecue.nvim",
	"https://github.com/SmiteshP/nvim-navic",
	"https://github.com/DaikyXendo/nvim-material-icon",
})
require("barbecue").setup({
	show_navic = true,
	show_dirname = true,
	show_basename = false,
})
