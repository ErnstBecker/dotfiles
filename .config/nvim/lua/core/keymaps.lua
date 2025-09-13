-- Set toggle modes ( Insert & Normal )
vim.keymap.set('n', '<Esc>', 'i', { noremap = true})
vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true })

-- Select all
vim.keymap.set('n', '<C-a>', 'ggVG')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
