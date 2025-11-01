return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		keymap = {
			fzf = {
				["ctrl-a"] = "select-all",
			},
		},
	},
	keys = {
		{ "<C-p>", "<Cmd>lua require('fzf-lua').global()<CR>", desc = "FZF Global" },
		{ "<C-k>", "<Cmd>lua require('fzf-lua').live_grep()<CR>", desc = "FZF Live Grep" },
		{ "<C-\\>", "<Cmd>lua require('fzf-lua').builtin()<CR>", desc = "FZF Builtin" },
	},
}
