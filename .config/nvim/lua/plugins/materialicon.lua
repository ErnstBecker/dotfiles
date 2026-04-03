return {
	"DaikyXendo/nvim-material-icon",
	config = function ()
		require("nvim-web-devicons").setup({
			override = {
				folder = {
					icon = "",
					color = "#7ebae4",
					name = "Folder"
				},
				folder_open = {
					icon = "",
					color = "#7ebae4",
					name = "FolderOpen"
				},
			},
		})
	end,
}
