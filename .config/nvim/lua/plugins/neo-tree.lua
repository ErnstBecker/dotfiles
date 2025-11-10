return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				never_show = {},
			},
			window = {
				mappings = {
					["s"] = "smart_open",
					["<cr>"] = "smart_open",
				},
			},
			commands = {
				smart_open = function(state)
					local node = state.tree:get_node()
					if node.type == "directory" then
						require("neo-tree.sources.filesystem.commands").toggle_node(state)
					else
						require("neo-tree.sources.filesystem.commands").open(state)
						vim.cmd("Neotree close")
					end
				end,
			},
		}
	}
}

