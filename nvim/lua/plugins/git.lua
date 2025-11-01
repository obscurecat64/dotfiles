return {
	{
		"tpope/vim-fugitive",
		cmd = "Git",
	},
	{
		"airblade/vim-gitgutter",
		event = "BufRead",
		keys = {
			{ "<leader>gg", ":<C-u>GitGutterToggle<CR>", desc = "Toggle GitGutter" },
		},
	},
}
