return {
	{
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup({
				compile = true,
				transparent = true,
				theme = "dragon",
				background = {
					dark = "dragon",
					light = "lotus"
				},
			})
			vim.cmd("colorscheme kanagawa")

			local highlights = {
				'LineNr',
				'CursorLine',
				'CursorLineNr',
				'SignColumn',
				'GitSignsAdd',
				'GitSignsChange',
				'GitSignsDelete',
				'DiagnosticSignError',
				'DiagnosticSignWarn',
				'DiagnosticSignInfo',
				'DiagnosticSignHint'
			}
			for _, hl in ipairs(highlights) do
				local current = vim.api.nvim_get_hl(0, { name = hl })
				current.bg = nil
				current.ctermbg = nil
				vim.api.nvim_set_hl(0, hl, current)
			end
		end
	}
}
