vim.keymap.set('n', '<Esc>', 'i', { noremap = true })
vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true })

vim.keymap.set('n', '<C-a>', 'ggVG', { desc = "Select All" })

vim.keymap.set('n', '<C-f>', '/', { desc = "Search forward" })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<C-S-p>', ':Telescope commands<CR>')
vim.keymap.set('n', '<C-p>', function()
	require('telescope.builtin').find_files()
end, {})

vim.keymap.set('n', '<leader>gd', ':Gitsigns preview_hunk<CR>', {})
vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', {})

