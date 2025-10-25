vim.keymap.set('n', '<Esc>', 'i', { noremap = true })
vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true })

vim.keymap.set('n', '<C-a>', 'ggVG', { desc = "Select All" })

vim.keymap.set('n', '<C-f>', '/', { desc = "Search forward" })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
