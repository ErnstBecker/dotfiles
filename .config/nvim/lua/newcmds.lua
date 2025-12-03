-- ======= LSP HOVER =======
function lsp_hover()
	local opts = {
		focusable = true,
		border = "single",
		max_width = math.floor(vim.o.columns * 0.8),
		max_height = math.floor(vim.o.lines * 0.4),
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		title = " LSP Hover ",
		title_pos = "center",
	}
	vim.lsp.buf.hover(opts)
end

-- ======= Colorscheme =======
function change_colorscheme()
	require("telescope.builtin").colorscheme {
		ignore_builtins = true,
		layout_strategy = "vertical",
		layout_config = {
			width = 0.2,
			height = 0.5
		}
	}
end

-- ======= DEBUG =======
function toggle_scopes()
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
end

function toggle_breakpoint()
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
end