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

-- ======= DEBUG =======

map("n", "<C-h>", function() require("dap").step_out() end)
map("n", "<C-j>", function() require("dap").step_over() end)
map("n", "<C-k>", function() require("dap").continue() end)
map("n", "<C-l>", function() require("dap").step_into() end)
map("n", "<leader>a", function() require("dap").toggle_breakpoint() end)

map("n", "<leader>s", function()
	local current_ft = vim.bo.filetype

	if current_ft == "dapui_scopes" then
		local wins = vim.api.nvim_list_wins()
		for _, win in ipairs(wins) do
			local buf = vim.api.nvim_win_get_buf(win)
			local ft = vim.api.nvim_buf_get_option(buf, "filetype")
			if ft ~= "dapui_scopes" and ft ~= "dapui_breakpoints" and ft ~= "dap-repl" then
				vim.api.nvim_set_current_win(win)
				return
			end
		end
	else
		vim.cmd("wincmd l")
		vim.cmd("wincmd k")
	end
end)

map("n", "<leader>b", function()
	local current_buftype = vim.bo.buftype
	local current_ft = vim.bo.filetype

	if current_buftype == "nofile" or current_ft == "dapui_scopes" or current_ft == "dapui_breakpoints" or current_ft == "dap-repl" then
		local main_win = vim.fn.win_findbuf(vim.fn.bufnr("#"))[1]
		if not main_win then
			vim.cmd("wincmd h")
		else
			vim.api.nvim_set_current_win(main_win)
		end
	else
		vim.cmd("wincmd l")
		vim.cmd("wincmd j")
	end
end)
