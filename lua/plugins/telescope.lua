return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzy-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
    },
    cmd = 'Telescope',
    config = function()
      require('telescope').setup({
        defaults = {
          live_grep = {
            additional_args = function()
              return {
                '--max-columns=150',
                '--glob=!*.lock',
                '--max-columns-preview',
                '--hidden',
                '--no-ignore-vcs',
              }
            end,
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
            '^.git/',
            '^node_modules/',
            '^vendor/',
            '^storage/framework/',
            '^storage/logs/',
          },
          debounce = 100,
          cache_picker = {
            num_pickers = 5,
            limit_entries = 1000,
          },
          sorting_strategy = 'ascending',
          prompt_prefix = '🔍 ',
          selection_caret = '➤ ',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              preview_width = 0.6,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
          },
        },
      })
      require('telescope').load_extension('fzy_native')
      require('telescope').load_extension('file_browser')
    end,
  },
}
