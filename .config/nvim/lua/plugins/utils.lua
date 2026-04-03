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
		dependencies = { "nvim-treesitter/nvim-treesitter", "DaikyXendo/nvim-material-icon" },
		opts = {},
	}
}
