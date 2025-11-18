vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params(nil, "utf-16")
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

local pending_theme = nil

vim.api.nvim_create_autocmd("ColorSchemePre", {
	callback = function(args)
		pending_theme = args.match
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		if pending_theme then
			local config_path = vim.fn.stdpath("config") .. "/theme.txt"
			local file = io.open(config_path, "w")
			if file then
				file:write(pending_theme)
				file:close()
			end
		end
		vim.schedule(function()
			require('configs.transparency').apply()
		end)
	end,
})
