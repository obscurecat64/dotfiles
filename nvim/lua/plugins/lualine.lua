return {
	"nvim-lualine/lualine.nvim",

	-- It needs nvim-web-devicons to show file icons
	dependencies = { "nvim-tree/nvim-web-devicons" },

	-- Lualine is fast and can be loaded lazily
	event = "VeryLazy",

	config = function()
		require("lualine").setup({
			options = {
				theme = "powerline",

				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },

				icons_enabled = true,
			},
			sections = {
				-- These are the components on the left side
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename", "readonly", "modified" },

				-- These are the components on the right side
				lualine_x = { "fileencoding", "fileformat", "filetype" },
				lualine_y = { "progress" }, -- This is 'percent'
				lualine_z = { "location" }, -- This is 'lineinfo'
			},
			inactive_sections = {
				-- Keep inactive windows simple
				lualine_c = { "filename" },
				lualine_x = { "location" },
			},
		})
	end,
}
