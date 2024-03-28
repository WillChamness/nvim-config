return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local config = require("neo-tree")
		config.setup({
			window = {
				width = 30,
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["<space>H"] = "toggle_hidden",
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree toggle filesystem reveal left<CR>")
	end,
}
