local config_path = vim.fn.stdpath("config") .. "/theme.txt"
local file = io.open(config_path, "r")
if file then
	local colorscheme = file:read("*all")
	file:close()
	vim.cmd("colorscheme " .. colorscheme)
end
