return {
	"scottmckendry/cyberdream.nvim",
	priority = 1000, -- Make sure it loads first
	config = function()
		vim.cmd("colorscheme cyberdream")
	end,
}
