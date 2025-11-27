local map = vim.keymap.set

-- ======= INSERT =======
map("n", "<Esc>", "i", { noremap = true })

map("i", "<Tab>", function()
	if require("blink.cmp").is_visible() then
		require("blink.cmp").accept()
	else
		return "<Tab>"
	end
end, { expr = true })

map("i", "<C-Space>", function()
	require("blink.cmp").show()
end)

-- ======= VISUAL MODE =======

-- Indentation with tab
map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })

-- ======= NORMAL MODE =======

-- Navigation and buffers
map("n", "<C-b>", ":Neotree toggle right<CR>")
map("n", "<C-w>", ":bdelete<CR>", { noremap = true, nowait = true })
map("n", "<leader>o", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit!<CR>")
map("n", "<C-a>", "ggVG", { desc = "Select All" })
map("n", "<C-Tab>", "<Plug>(cokeline-focus-next)")

-- Search
map("n", "<C-f>", "/", { desc = "Search forward" })
map("n", "<leader><C-f>", function()
	require("telescope.builtin").live_grep()
end, { desc = "Find text with Telescope" })
map("n", "<leader><Esc>", ":nohlsearch<CR>")

-- Telescope
map("n", "<C-p>", function()
	require("telescope.builtin").find_files()
end)
map("n", "<C-S-p>", ":Telescope commands<CR>")
map("n", "<leader>gp", ":Telescope git_status<CR>")

-- Git
map("n", "<leader>gd", ":Gitsigns preview_hunk<CR>")

-- Colorscheme
map("n", "<leader><C-t>", function ()
	require("telescope.builtin").colorscheme {
		ignore_builtins = true,
		layout_strategy = "vertical",
		layout_config = {
			width = 0.2,
			height = 0.5
		}
	}
end)

-- ======= LSP =======

map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
map("n", "gR", "<cmd>Telescope lsp_references<CR>")
map("n", "<leader>rn", vim.lsp.buf.rename)
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")
map("n", "K", vim.lsp.buf.hover)
