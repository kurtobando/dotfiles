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
  \ 'coc-tailwindcss',
  \ 'coc-tsserver',
  \ 'coc-tsserver-dev',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-format-json',
  \ 'coc-php-cs-fixer',
  \ ]

" Add CoC-specific performance settings
let g:coc_node_args = ['--max-old-space-size=8192']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden                              " Allow switching buffers without saving
set history=1000                        " Increase command history
set updatetime=300                      " Faster completion and better UX
set timeoutlen=500                      " Faster key sequence completion
set mouse=a                             " Enable mouse support in all modes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                              " Show line numbers
set relativenumber                      " Show relative line numbers
set cursorline                          " Highlight current line
set signcolumn=yes                      " Always show sign column
set showmatch                           " Highlight matching brackets
set termguicolors                       " Enable true colors support
set scrolloff=8                         " Keep 8 lines above/below cursor
set sidescrolloff=8                     " Keep 8 characters left/right of cursor
set showtabline=2                       " Always show tab line
set noshowmode                          " Don't show mode (use status line instead)
set splitbelow                          " Open horizontal splits below
set splitright                          " Open vertical splits right

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase                          " Case insensitive search
set smartcase                           " Case sensitive if uppercase present
set hlsearch                            " Highlight search results
set incsearch                           " Show matches while typing
set wrapscan                            " Wrap around when searching

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation and Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                           " Use spaces instead of tabs
set smarttab                            " Insert spaces based on shiftwidth
set tabstop=4                           " Width of tab character
set softtabstop=4                       " Fine tunes amount of whitespace
set shiftwidth=4                        " Size of indent
set smartindent                         " Smart autoindenting on new lines
set autoindent                          " Copy indent from current line for new lines
set wrap                                " Enable line wrapping
set linebreak                           " Wrap lines at convenient points
set breakindent                         " Preserve indentation in wrapped text

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Handling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autowrite                           " Auto save before commands like :next
set autoread                            " Auto reload if file changed outside
set nobackup                            " Don't create backup files
set nowritebackup                       " Don't create backup while editing
set undofile                            " Persistent undo history
set undolevels=1000                     " Maximum undo levels
set clipboard=unnamedplus               " Use system clipboard
set encoding=utf-8                      " Set default encoding
set fileencoding=utf-8                  " Set default file encoding

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Performance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lazyredraw                          " Don't redraw while executing macros
set ttyfast                             " Faster terminal connection
set synmaxcol=3000                      " Highlight up to 3000 columns
set redrawtime=10000                    " Allow more time for syntax highlighting
set updatetime=300                      " Faster completion
set maxmempattern=2000000               " Increase memory limit for syntax highlighting
set re=0                                " Use new regexp engine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" Core and Dependencies
Plug 'tpope/vim-sensible'                                   " Sensible defaults
Plug 'nvim-lua/plenary.nvim'                                " Required by many plugins

" Completion and Intelligence
Plug 'neoclide/coc.nvim', {'branch': 'release'}             " Code completion
Plug 'github/copilot.vim'                                   " AI code suggestions

" File Navigation and Explorer
Plug 'nvim-lualine/lualine.nvim'                            " Status line
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }    " Fuzzy finder
Plug 'nvim-telescope/telescope-fzy-native.nvim'             " Better sorting performance
Plug 'nvim-telescope/telescope-file-browser.nvim'           " Better file browsing
Plug 'nvim-tree/nvim-tree.lua'                              " File explorer
Plug 'nvim-tree/nvim-web-devicons'                          " Icons for nvim-tree
Plug 'tpope/vim-surround'                                   " Surround text objects
Plug 'ray-x/lsp_signature.nvim'                             " Show signature

" Git Integration
Plug 'lewis6991/gitsigns.nvim'                              " Git signs in the gutter

" Syntax and Language, then Formatter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting
Plug 'mhartington/formatter.nvim'

" UI Enhancements
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }              " Buffer line
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }        " Collection of minimal plugins

" Theme
Plug 'folke/tokyonight.nvim'                                " Color scheme

" Laravel/Blade Support
Plug 'jwalton512/vim-blade'                                 " Blade syntax highlighting

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require('lualine').setup()
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    "php",
    "html",
    "css",
    "javascript",
    "typescript",
    "json",
    "lua",
    "python",
    "bash",
    "yaml"
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
  filters = {
    dotfiles = false,
    custom = {
      -- Explicitly exclude patterns except .env
      "^.git$",
      "^node_modules$",
      "^vendor$",
      ".DS_Store",
      -- Add any other patterns you want to hide
    },
    exclude = {},
  },
  git = {
    enable = false,  -- Disable git integration to prevent gitignore rules
  },
  renderer = {
    highlight_git = false,
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
    live_grep = {
      additional_args = function()
        return {
          "--max-columns=150",
          "--glob=!*.lock",
          "--max-columns-preview",
          "--hidden",
          "--no-ignore-vcs",
        }
      end
   },
   vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--type-not=lock',
      '--type-not=sql',
      '--type-not=json',
      '--hidden',
      '--glob=!.git/*',
      '--glob=!node_modules/*',
      '--glob=!vendor/*',
    },
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = {
      "^.git/",
      "^node_modules/",
      "^vendor/",
      "^storage/framework/",
      "^storage/logs/",
    },
    debounce = 100,
    cache_picker = {
      num_pickers = 5,
      limit_entries = 1000,
    },
    sorting_strategy = "ascending",
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        preview_width = 0.6,
      },
    }
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    }
  }
}
require("tokyonight").setup({
    transparent = false,
    styles = {
        sidebars = "dark",
        floats = "dark",
        keywords = {
            italic = false
        }
    },
    on_colors = function(colors)
        colors.bg = "#000000"
        colors.bg_dark = "#000000"
        colors.bg_float = "#000000"
        colors.bg_popup = "#000000"
        colors.bg_sidebar = "#000000"
        colors.bg_statusline = "#000000"
    end,
    on_highlights = function(hl, c)
        hl['@comment.php'] = {
            fg = "#636da6"
        }
    end
})

-- Helper function for Prettier configuration
local function get_prettier_config()
  return {
    exe = 'prettier',
    args = {
      '--stdin-filepath',
      vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
      '--single-quote',
    },
    stdin = true,
    try_node_modules = true,
  }
end

require('formatter').setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    javascript = { get_prettier_config },
    typescript = { get_prettier_config },
    json = { get_prettier_config },
    vue = { get_prettier_config },
    html = { get_prettier_config },
    css = { get_prettier_config },
    yaml = { get_prettier_config },
    yml = { get_prettier_config },

    php = {
      function()
        vim.fn.CocAction('format')
        return {
          exe = "true",
          stdin = false,
        }
      end
    },

    python = {
      function()
        return {
          exe = 'black',
          args = {'-', '--quiet'},
          stdin = true,
        }
      end,
    },

    sh = {
      function()
        return {
          exe = 'shfmt',
          args = {
            '-i', '2',
            '-bn',
            '-ci',
            '-sr',
            '-',
          },
          stdin = true,
        }
      end,
    },

    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--search-parent-directories',
            '--stdin-filepath',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            '--', '-',
          },
          stdin = true,
        }
      end,
    },

    vim = {
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    }
  }
})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Telescope 
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>bd :bd<CR>
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

" Use K & Ctrl+Space to show documentation in preview window
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> <C-Space> :call ShowDocumentation()<CR>

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

" Use <TAB> to navigate through popup menu"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Clear search highlighting with <Esc>
nnoremap <Esc> :noh<CR>

" Format entire file
nnoremap <silent> <leader>f :Format<CR>
nnoremap <silent> <leader>F :FormatWrite<CR>

" Format selected code 
xmap <leader>fs <Plug>(coc-format-selected)

" Show all diagnostics
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Show commands
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>

" Show symbols
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>



" Set colorscheme
colorscheme tokyonight-night
