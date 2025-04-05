call plug#begin()

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" autopairs
Plug 'windwp/nvim-autopairs'

" lightline
Plug 'itchyny/lightline.vim'

" theme
Plug 'scottmckendry/cyberdream.nvim'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" git stuffs
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" lsp
Plug 'neovim/nvim-lspconfig'

call plug#end()

" autopairs
lua << EOF
require'nvim-autopairs'.setup {}
EOF

" lsp
lua << EOF
require'lspconfig'.ts_ls.setup {}
EOF

" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
EOF

" border for floating preview
lua << EOF
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white]]

local border = {
    {"╭", "FloatBorder"},
    {"─", "FloatBorder"},
    {"╮", "FloatBorder"},
    {"│", "FloatBorder"},
    {"╯", "FloatBorder"},
    {"─", "FloatBorder"},
    {"╰", "FloatBorder"},
    {"│", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
EOF

" vim settings
colorscheme cyberdream
set signcolumn=number
set number
set relativenumber
set tabstop=2 shiftwidth=2 expandtab
set noswapfile
set clipboard^=unnamed,unnamedplus
set hidden
set nobackup
set nowritebackup

" blamer settings
let g:blamer_delay = 300
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0

" mappings
" toggle git gutter
nnoremap <leader>gg :<C-u>GitGutterToggle<CR>
" toggle blamer
nnoremap <leader>gb :BlamerToggle<CR>
" enlarge window height and width
nnoremap <silent> <Leader>f <C-w>= \| :<C-u>exe "resize" (winheight(0) * 3/2) \| exe "vert resize" (winwidth(0) * 4/3)<CR>
" fzf.vim shortcuts
nnoremap <C-k> :<C-u>GF <CR>
nnoremap <C-p> :<C-u>Ag <CR>
nnoremap <C-h> :<C-u>Hist <CR>
" apply treesitter foldexpr
nnoremap <silent> <leader>fe :setlocal foldexpr=v:lua.vim.treesitter.foldexpr()<CR> :setlocal foldlevel=2<CR> :setlocal foldmethod=expr<CR> 

" remove this low usage command that conflicts with Explore
silent! delcommand EditQuery
