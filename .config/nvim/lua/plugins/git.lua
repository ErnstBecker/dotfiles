vim.pack.add ({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/esmuellert/vscode-diff.nvim",
	"https://github.com/MunifTanjim/nui.nvim"
})

require("gitsigns").setup({
	current_line_blame = true
})
