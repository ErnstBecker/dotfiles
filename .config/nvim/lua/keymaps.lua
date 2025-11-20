-- ======= INSERT =======

vim.keymap.set('n', '<Esc>', 'i', { noremap = true })

vim.keymap.set('i', '<Tab>', function()
	if require("blink.cmp").is_visible() then
		require("blink.cmp").accept()
	else
		return '<Tab>'
	end
end, { expr = true })

vim.keymap.set('i', '<C-Space>', function()
	require("blink.cmp").show()
end)

-- ======= VISUAL MODE =======

-- Indentation with tab
vim.keymap.set('v', '<Tab>', '>gv', { desc = "Indent selection" })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = "Unindent selection" })

-- ======= NORMAL MODE =======

-- Navigation and buffers
vim.keymap.set('n', '<C-b>', ':Neotree toggle right<CR>')
vim.keymap.set('n', '<C-w>', ':bdelete<CR>', { noremap = true, nowait = true })
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit!<CR>')
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = "Select All" })
vim.keymap.set('n', '<C-Tab>', '<Plug>(cokeline-focus-next)')

-- Search
vim.keymap.set('n', '<C-f>', '/', { desc = "Search forward" })
vim.keymap.set('n', '<leader><C-f>', function()
	require('telescope.builtin').live_grep()
end, { desc = "Find text with Telescope" })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Telescope
vim.keymap.set('n', '<C-p>', function()
	require('telescope.builtin').find_files()
end)
vim.keymap.set('n', '<C-S-p>', ':Telescope commands<CR>')
vim.keymap.set('n', '<leader>gp', ':Telescope git_status<CR>')

-- Git
vim.keymap.set('n', '<leader>gd', ':Gitsigns preview_hunk<CR>')

-- Colorscheme
vim.keymap.set('n', '<leader><C-t>', ':Themer<CR>')

-- ======= LSP =======

vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")
vim.keymap.set("n", "K", vim.lsp.buf.hover)
