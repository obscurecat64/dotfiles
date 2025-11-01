return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Run this command after install/update
	event = "BufRead",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"javascript",
				"typescript",
				"tsx",
				"vue",
				"html",
				"css",
				"json",
				"lua",
				"vim",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
