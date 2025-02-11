call plug#begin()

let mapleader = " "

set number
set clipboard=unnamedplus

" Keymap
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>qq :q<CR>

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Defaults
Plug 'tpope/vim-sensible'

" Theme
Plug 'folke/tokyonight.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

call plug#end()

colorscheme tokyonight
