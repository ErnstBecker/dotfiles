vim.pack.add("https://github.com/nvim-treesitter/nvim-treesitter")

require("nvim-treesitter.configs").setup({
	ensure_installed = { "rust", "toml", "json", "bash", "go", "python" },
	highlight = { enable = true },
	indent = { enable = true },
})
