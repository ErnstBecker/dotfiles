local o = vim.opt

vim.g.mapleader = ' '

o.clipboard = "unnamedplus"
o.hidden = false
o.laststatus = 3
o.autowrite = true
o.autoread = true

o.expandtab = false
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.shiftround = true

o.list = true
o.listchars = { tab = '  ', lead = '·', trail = '·', nbsp = '␣', extends = '…' }

o.signcolumn = "yes"
o.number = true
o.relativenumber = true
o.cursorline = true
o.cursorlineopt = "number"
