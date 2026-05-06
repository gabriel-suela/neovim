return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		opts = {
			window = {
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
				},
			},
			follow_current_file = {
				enabled = true,
			},
			bind_to_cwd = true,
		},
		lazy = true, -- neo-tree will lazily load itself
	},
}
