vim.opt.signcolumn = 'number'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.sessionoptions = 'blank,buffers,curdir,tabpages,winsize,terminal'
vim.opt.winborder = 'rounded'

-- remove this command that conflicts with Explore
vim.cmd('silent! delcommand EditQuery')
