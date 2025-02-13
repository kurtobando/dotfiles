call plug#begin()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

set number
set clipboard=unnamedplus
set autowrite " Automatically save before commands like :next and :make
set smartcase " Do smart case matching
set showmatch " Show matching bracket.
set ignorecase " Do case insensitive matching
set smartindent " Do smart autoindenting when starting a new line

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>qq :q<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Coc code actions
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>aC <Plug>(coc-codeaction-cursor)
vmap <leader>ac <Plug>(coc-codeaction-selected)

" Quick window navigation
nnoremap <C-Up> <C-W>k
nnoremap <C-Down> <C-W>j
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

" Copilot setup
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
imap <silent> <C-n> <Plug>(copilot-next)
imap <silent> <C-p> <Plug>(copilot-previous)
imap <silent> <C-\> <Plug>(copilot-dismiss)
let g:copilot_no_tab_map = v:true
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'github/copilot.vim'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additonal Setups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme
colorscheme tokyonight-night

" Lua Configuration
lua <<EOF
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true,
    disable = {} -- Disable problematic languages temporarily
  },
}
require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  update_cwd = true,
  view = {
    width = 60,
    side = 'right',
  },
}
require('mini.pairs').setup({
    -- Add custom pairs if needed
    pairs = {
        { '(', ')' },
        { '[', ']' },
        { '{', '}' },
        { '"', '"' },
        { "'", "'" },
        { '`', '`' },
    }
})
require('mini.move').setup({
  mappings = {
    -- Move visual selection using Control + Shift + arrow keys
    left = '<C-S-Left>',
    right = '<C-S-Right>',
    down = '<C-S-Down>',
    up = '<C-S-Up>',

    -- Move current line in Normal mode (same keys)
    line_left = '<C-S-Left>',
    line_right = '<C-S-Right>',
    line_down = '<C-S-Down>',
    line_up = '<C-S-Up>',
  },
  
  options = {
    reindent_linewise = true,
  },
})
require("bufferline").setup{}
require('telescope').setup{
  defaults = {
    find_command = {'rg', '--files', '--hidden', '--glob', '!.git/'},
    file_ignore_patterns = {
	".git/",
	"node_modules/",
	"vendor/",
	"storage/framework/"
    }
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
EOF

