-- Enlarge window height and width
local function ResizeCurrentWindow()
  local current_win = vim.fn.winnr()

  vim.cmd('resize ' .. math.floor(vim.fn.winheight(0) * 3 / 2))
  vim.cmd('vertical resize ' .. math.floor(vim.fn.winwidth(0) * 4 / 3))

  -- set quickfix windows to 10 lines high
  for w = 1, vim.fn.winnr('$') do
    local buftype = vim.fn.getbufvar(vim.fn.winbufnr(w), '&buftype')
    if buftype == 'quickfix' then
      vim.cmd(w .. 'wincmd w')
      vim.cmd('resize 10')
    end
  end

  vim.cmd(current_win .. 'wincmd w')
end

vim.keymap.set('n', '<Leader>e', ResizeCurrentWindow, { silent = true, desc = "Enlarge Window" })
