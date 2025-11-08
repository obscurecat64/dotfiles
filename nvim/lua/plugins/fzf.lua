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
		{ "<C-\\>", "<Cmd>lua require('fzf-lua').buffers()<CR>", desc = "FZF Buffers" },
		{ "<C-p>", "<Cmd>lua require('fzf-lua').files()<CR>", desc = "FZF Files" },
		{ "<C-n>", "<Cmd>lua require('fzf-lua').live_grep()<CR>", desc = "FZF Live Grep" },
		{ "<C-k>", "<Cmd>lua require('fzf-lua').builtin()<CR>", desc = "FZF Builtin" },
	},
}
