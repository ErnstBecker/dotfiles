local M = {}

M.groups = {
	"Normal",
	"NormalNC",
	"NormalSB",
	"NormalFloat",
	"LineNr",
	"CursorLine",
	"CursorLineNr",
	"SignColumn",
	"GitSignsAdd",
	"GitSignsChange",
	"GitSignsDelete",
	"DiagnosticSignError",
	"DiagnosticSignWarn",
	"DiagnosticSignInfo",
	"DiagnosticSignHint",
	"TelescopeNormal",
	"TelescopeBorder",
	"TelescopePromptNormal",
	"TelescopePromptBorder",
	"TelescopeResultsNormal",
	"TelescopeResultsBorder",
	"TelescopePreviewNormal",
	"TelescopePreviewBorder",
}

M.apply = function()
	for _, hl in ipairs(M.groups) do
		local current = vim.api.nvim_get_hl(0, { name = hl })
		current.bg = nil
		current.ctermbg = nil
		vim.api.nvim_set_hl(0, hl, current)
	end
end

return M
