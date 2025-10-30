return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"rust_analyzer",
			"gopls",
			"lua_ls",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
