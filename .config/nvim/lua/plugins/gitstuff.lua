return {
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup(
				{
					current_line_blame = true
				}
			)
			vim.keymap.set('n', '<leader>gd', ':Gitsigns preview_hunk<CR>', {})
			vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', {})
		end
	}
}
