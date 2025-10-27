return {
	{
		'nvim-telescope/telescope-ui-select.nvim',
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		lazy = false,
		config = function()
			require('telescope').setup({
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
