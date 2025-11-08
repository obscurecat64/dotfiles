-- Use pcall to safely attempt to delete the buffer-local 's' map.
-- This prevents E31: No such mapping error if the map is already gone.
local ok = pcall(function()
	vim.keymap.del("n", "s", { buffer = true })
end)
