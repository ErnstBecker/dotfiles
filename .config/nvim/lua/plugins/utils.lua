vim.pack.add ({
	"https://github.com/tpope/vim-surround",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/catgoose/nvim-colorizer.lua",
})

require("nvim-autopairs").setup({
	event = "InsertEnter",
	config = true
})

require("colorizer").setup({
	filetypes = { "*" },
})
