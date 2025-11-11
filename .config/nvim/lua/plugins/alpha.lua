return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"          .                                                      .",
			"        .n                   .                 .                  n.",
			"  .   .dP                  dP                   9b                 9b.    .",
			" 4    qXb         .       dX                     Xb       .        dXp     t",
			"dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb",
			"9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP",
			" 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP",
			"  `9XXXXXXXXXXXXXXXXXXXXX'~   ~`OOO8b   d8OOO'~   ~`XXXXXXXXXXXXXXXXXXXXXP'",
			"    `9XXXXXXXXXXXP' `9XX'   DIE    `98v8P'  HUMAN   `XXP' `9XXXXXXXXXXXP'",
			"        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~",
			"                        )b.  .dbo.dP'`v'`9b.odb.  .dX(",
			"                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.",
			"                     dXXXXXXXXXXXP'   .   `9XXXXXXXXXXXb",
			"                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb",
			"                    9XXb'   `XXXXXb.dX|Xb.dXXXXX'   `dXXP",
			"                     `'      9XXXXXX(   )XXXXXXP      `'",
			"                              XXXX X.`v'.X XXXX",
			"                              XP^X'`b   d'`X^XX",
			"                              X. 9  `   '  P )X",
			"                              `b  `       '  d'",
			"                               `             '",
		}

		dashboard.section.buttons.val = {
			dashboard.button("<C-n>", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("<C-o>", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("<C-f>", "󰈬  Search for word", ":Telescope live_grep <CR>"),
			dashboard.button("<C-r>", "  Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		vim.api.nvim_set_hl(0, "AlphaRed", { fg = "#ff0043" })

		local ns = vim.api.nvim_create_namespace("alpha_red_words")
		local targets = { "DIE", "HUMAN" }

		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				local buf = vim.api.nvim_get_current_buf()
				for i, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
					for _, word in ipairs(targets) do
						local s, e = line:find(word)
						if s then
							vim.api.nvim_buf_add_highlight(buf, ns, "AlphaRed", i - 1, s - 1, e)
						end
					end
				end
			end,
		})

		dashboard.section.preview = nil
		alpha.setup(dashboard.opts)
	end
};
