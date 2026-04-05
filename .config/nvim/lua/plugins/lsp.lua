vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup({
	ui = {
		icons = {
			package_installed   = "✓",
			package_pending     = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "gopls", "lua_ls" },
	automatic_enable = true,
})
