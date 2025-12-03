return {
	"xiyaowong/transparent.nvim",
	opts = {
		groups = {
			"Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
			"Statement", "PreProc", "Type", "Underlined", "Todo", "String", "Function",
			"Conditional", "Repeat", "Operator", "Structure", "LineNr", "NonText",
			"SignColumn", "CursorLine", "CursorLineNr", "StatusLine", "StatusLineNC",
			"EndOfBuffer", "NormalFloat"
		},
		extra_groups = {
			-- Git
			"GitSignsAdd",
			"GitSignsChange",
			"GitSignsDelete",
			-- Diagnostic
			"DiagnosticSignError",
			"DiagnosticSignWarn",
			"DiagnosticSignInfo",
			"DiagnosticSignHint",
			-- Telescope
			"TelescopeNormal",
			"TelescopeBorder",
			"TelescopePromptNormal",
			"TelescopeResultsNormal",
			"TelescopePreviewNormal",
			-- Neo-tree
			"NeoTreeNormal",
			"NeoTreeNormalNC",
			"NeoTreeWinSeparator",
			"NeoTreeEndOfBuffer",
			"NeoTreeGitModified",
			"NeoTreeGitAdded",
			"NeoTreeGitDeleted",
		},
	}
}
