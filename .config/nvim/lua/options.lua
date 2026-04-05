vim.g.mapleader = " "

-- behavior
vim.opt.clipboard    = "unnamedplus"
vim.opt.hidden       = false
vim.opt.autowrite    = true
vim.opt.autoread     = true

-- indentation
vim.opt.expandtab    = false
vim.opt.smartindent  = true
vim.opt.tabstop      = 2
vim.opt.shiftwidth   = 2
vim.opt.shiftround   = true

-- display
vim.opt.laststatus   = 3
vim.opt.cmdheight    = 0
vim.opt.number       = true
vim.opt.relativenumber = true
vim.opt.cursorline   = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn   = "yes"
vim.opt.list         = true
vim.opt.listchars    = { tab = "  ", lead = "·", trail = "·", nbsp = "␣", extends = "…" }
