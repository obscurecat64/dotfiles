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
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffCommit" },
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview Open" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview File History" },
		},
		opts = {},
		config = function(_, opts)
			require("diffview").setup(opts)
			vim.api.nvim_create_user_command("DiffCommit", function(args)
				local commit = args.args
				vim.cmd("DiffviewOpen " .. commit .. "^!")
			end, { nargs = 1 })
		end,
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
