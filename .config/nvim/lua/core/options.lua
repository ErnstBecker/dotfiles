-- Set leader keys for easy keybindings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Configure backspace behavior, allow backspace over indent, line breaks, and insert mode commands
vim.opt.backspace = '2'

-- Display command in the command line and always show the status line
vim.opt.showcmd = true
vim.opt.laststatus = 2

-- Automatically save changes when switching buffers and reload files when changed externally
vim.opt.autowrite = true
vim.opt.autoread = true

-- Highlight the current line for better visibility
vim.opt.cursorline = false

-- Use tabs for identation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = false


vim.o.number = true
vim.cmd("autocmd ColorScheme * hi LineNr guibg=NONE ctermbg=NONE")

