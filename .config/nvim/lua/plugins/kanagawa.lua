return {
	{
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup({
				compile = true,
				undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true,
				dimInactive = false,
				terminalColors = true,
				colors = {
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors)
					return {}
				end,
				theme = "dragon",
				background = {
					dark = "dragon",
					light = "lotus"
				},
			})

			vim.cmd("colorscheme kanagawa")
			local highlights = { 
				'LineNr',
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
