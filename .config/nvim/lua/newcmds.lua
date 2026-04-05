local M = {}

-- ======= LSP HOVER =======
function M.lsp_hover()
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

return M
