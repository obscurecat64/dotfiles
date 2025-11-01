return {
	"stevearc/conform.nvim",

	-- These are lazy-loading triggers
	event = { "BufWritePre" }, -- Triggers on save
	cmd = { "ConformInfo" }, -- Triggers on command

	-- This adds a keymap to format manually
	keys = {
		{
			"<leader>f", -- <leader> + f
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n", -- Normal mode
			desc = "Format buffer",
		},
	},

	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			tsx = { "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			c = { "clang-format" },
		},
	},
}
