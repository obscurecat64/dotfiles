call plug#begin()

" fuzzy finder
Plug 'ibhagwan/fzf-lua'
Plug 'nvim-tree/nvim-web-devicons'

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

" prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" motion
Plug 'ggandor/leap.nvim'
call plug#end()

" fzf-lua
lua << EOF
require("fzf-lua").setup {
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    }
  }
}
EOF

" autopairs
lua << EOF
require'nvim-autopairs'.setup {}
EOF

" lsp
lua << EOF
vim.lsp.enable('ts_ls')
EOF

" leap
lua << EOF
require('leap').add_default_mappings()
EOF

" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "vue",
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
set signcolumn=number
set number
set relativenumber
set tabstop=2 shiftwidth=2 expandtab
set noswapfile
set clipboard^=unnamed,unnamedplus
set hidden
set nobackup
set nowritebackup
set sessionoptions=blank,buffers,curdir,tabpages,winsize,terminal

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
function! ResizeCurrentWindow()
  let current_win = winnr()

  exe 'resize' (winheight(0) * 3 / 2)
  exe 'vertical resize' (winwidth(0) * 4 / 3)

  " set quickfix windows to 10 lines high
  for w in range(1, winnr('$'))
    let buftype = getbufvar(winbufnr(w), '&buftype')
    if buftype ==# 'quickfix'
      exe w . 'wincmd w'
      resize 10
    endif
  endfor

  exe current_win . 'wincmd w'
endfunction
nnoremap <silent> <Leader>e :call ResizeCurrentWindow()<CR>
" FZF-Lua key mappings
nnoremap <C-p> <Cmd>lua require("fzf-lua").global()<CR>
nnoremap <C-k> <Cmd>lua require("fzf-lua").live_grep()<CR>
nnoremap <C-\> <Cmd>lua require("fzf-lua").builtin()<CR>

" remove this low usage command that conflicts with Explore
silent! delcommand EditQuery

" theme
colorscheme cyberdream
