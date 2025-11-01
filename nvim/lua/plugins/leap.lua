return {
	"ggandor/leap.nvim",
	config = function()
		vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)", { desc = "Leap Forward" })
		vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)", { desc = "Leap Backward" })
	end,
}
