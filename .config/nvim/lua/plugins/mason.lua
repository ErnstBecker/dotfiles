return {
	"mason-org/mason.nvim",
	opts = {
		ensure_installed = { 
			"rust_analyzer",
			"gopls",
			"ts_ls",
			"lua_ls"
		},
	},
}
