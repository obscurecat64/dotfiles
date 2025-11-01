return {
	"neovim/nvim-lspconfig",
	-- Load when you open a file that needs LSP
	ft = { "javascript", "typescript", "tsx", "vue" },
	config = function()
		vim.lsp.enable("ts_ls")
	end,
}
