return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"leoluz/nvim-dap-go"
	},
	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({ automatic_installation = true })

		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "breakpoints", size = 0.25 },
						{ id = "scopes", size = 0.75 },
					},
					size = 40,
					position = "right",
				},
				{
					elements = {
						{ id = "repl", size = 1 },
					},
					size = 10,
					position = "bottom",
				},
			},
			expand_lines = false,
			force_buffers = true,
		})
		require("dap-go").setup()

		dap.configurations.go = {
			{
				type = "go",
				name = "Debug main.go",
				request = "launch",
				program = "${workspaceFolder}/main.go",
			},
		}

		dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
		dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
		dap.listeners.before.event_exited["dapui"] = function() dapui.close() end
	end
}
