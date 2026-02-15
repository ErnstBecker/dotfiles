return {
	{
		"tpope/vim-surround"
	},
	{
		"numToStr/Comment.nvim"
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	}
}
