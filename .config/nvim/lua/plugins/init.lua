for _, file in ipairs(vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins", "*.lua", false, true)) do
	local name = vim.fn.fnamemodify(file, ":t:r")
	if name ~= "init" then
		require("plugins." .. name)
	end
end
