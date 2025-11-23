return {
	{
		'nvim-telescope/telescope-ui-select.nvim',
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup({
				defaults = {
					hidden = true,
					file_ignore_patterns = {
						"%.git/",
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = true,
					},
				},
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown({}),
					},
				},
			})
			local builtin = require('telescope.builtin')

			require('telescope').load_extension('ui-select')
		end,
	},
}
