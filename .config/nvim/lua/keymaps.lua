local map = vim.keymap.set
local cmds = require("newcmds")

-- ======= INSERT =======
map("n", "<Esc>", "i", { noremap = true })

map("i", "<Tab>", function()
	if require("blink.cmp").is_visible() then
		vim.schedule(function() require("blink.cmp").accept() end)
		return ""
	elseif require("blink.cmp").snippet_active() then
		vim.schedule(function() require("blink.cmp").snippet_forward() end)
		return ""
	else
		return "<Tab>"
	end
end, { expr = true })

map("i", "<S-Tab>", function()
	if require("blink.cmp").snippet_active() then
		vim.schedule(function() require("blink.cmp").snippet_backward() end)
		return ""
	else
		return "<S-Tab>"
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
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit!<CR>")
map("n", "<C-a>", "ggVG", { desc = "Select All" })
map("n", "<C-Tab>", "<Plug>(cokeline-focus-next)", { desc = "Next buffer" })
map("n", "<C-S-Tab>", "<Plug>(cokeline-focus-prev)", { desc = "Prev buffer" })

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

-- ======= LSP =======
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definition"})
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Go to reference" })
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "variable rename" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")
map("n", "K", cmds.lsp_hover, { desc = "LSP Hover" })
