vim.pack.add ({
	"https://github.com/tpope/vim-surround",
	"https://github.com/numToStr/Comment.nvim",
	"https://github.com/windwp/nvim-autopairs",
})

require("nvim-autopairs").setup({
	event = "InsertEnter",
	config = true
})

require("Comment").setup()
