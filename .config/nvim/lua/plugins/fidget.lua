vim.pack.add { "https://github.com/j-hui/fidget.nvim" }
require("fidget").setup({
	notification = {
		window = {
			winblend = 0,
		}
	}
})
