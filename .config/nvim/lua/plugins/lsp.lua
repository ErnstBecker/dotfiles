return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"rust_analyzer",
				"gopls",
				"lua_ls",
			},
			automatic_installation = true
		},
		handlers = {
			function(server_name)
				vim.lsp.enable(server_name)
			end,
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed   = "✓",
					package_pending     = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config.lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			}

			vim.lsp.enable("lua_ls")
		end
	}
}
