call plug#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set global extensions for CoC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ '@yaegassy/coc-intelephense',
  \ '@yaegassy/coc-laravel',
  \ '@yaegassy/coc-phpstan',
  \ '@yaegassy/coc-volar',
  \ '@yaegassy/coc-volar-tools',
  \ 'coc-actions',
  \ 'coc-blade',
  \ 'coc-css',
  \ 'coc-dotenv',
  \ 'coc-emmet',
  \ 'coc-git',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-html-css-support',
  \ 'coc-jsref',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-php-cs-fixer',
  \ 'coc-phpfmt',
  \ 'coc-prettier',
  \ 'coc-tailwindcss',
  \ 'coc-tsserver',
  \ 'coc-tsserver-dev',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
  \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

set number
set clipboard=unnamedplus
set smartcase
set smartindent
set autowrite 
set showmatch 
set ignorecase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'github/copilot.vim'
Plug 'folke/tokyonight.nvim'

call plug#end()

colorscheme tokyonight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true,
    disable = {} 
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
    pairs = {
        { '(', ')' },
        { '[', ']' },
        { '{', '}' },
        { '"', '"' },
        { "'", "'" },
        { '`', '`' },
    },
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>qq :q<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

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

" Keymap to format the current file
nnoremap <leader>fm :call CocAction('format')<CR>

" Use <TAB> to navigate through popup menu"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


