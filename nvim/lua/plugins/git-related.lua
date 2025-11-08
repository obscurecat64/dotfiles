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
	{
		"f-person/git-blame.nvim",
		keys = {
			{ "<leader>gb", ":<C-u>GitBlameToggle<CR>", desc = "Toggle GitBlame" },
		},
		opts = {
			enabled = false,
			message_template = " <summary> • <date> • <author> • <<sha>>",
			date_format = "%r",
			virtual_text_column = 1,
			gitblame_use_blame_commit_file_urls = true,
		},
	},
}
