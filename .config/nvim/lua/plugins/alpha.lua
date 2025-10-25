return {
	'goolord/alpha-nvim',
	config = function ()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			" _________________",
			"|# :           : #|",
			"|  :  Neo      :  |",
			"|  :     Vim   :  |",
			"|  :           :  |",
			"|  :___________:  |",
			"|     _________   |",
			"|    | __      |  |",
			"|    ||  |     |  |",
			"\\____||__|_____|__|",
		}

		dashboard.section.buttons.val = {
			dashboard.button("<C-n>", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("<C-o>", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("<C-f>", "󰈬  Search for word", ":Telescope live_grep <CR>"),
			dashboard.button("<C-r>", "  Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		dashboard.section.preview = nil
		alpha.setup(dashboard.opts)
	end
};
