return {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			check = { command = "clippy" },
			cargo = { allFeatures = true },
		},
	},
}
