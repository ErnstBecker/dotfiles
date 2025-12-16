return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					hidden = true,
					file_ignore_patterns = {
						"%.git/",
						"%.vscode/",
					},
					mappings = {
						n = {
							["j"] = require("telescope.actions").move_selection_next,
							["k"] = require("telescope.actions").move_selection_previous,
						},
						i = {
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = false,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
