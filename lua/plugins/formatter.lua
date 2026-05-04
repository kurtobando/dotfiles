return {
  {
    'mhartington/formatter.nvim',
    cmd = { 'Format', 'FormatWrite' },
    config = function()
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
                exe = 'true',
                stdin = false,
              }
            end,
          },

          python = {
            function()
              return {
                exe = 'black',
                args = { '-', '--quiet' },
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

          ['*'] = {
            require('formatter.filetypes.any').remove_trailing_whitespace,
          },
        },
      })
    end,
  },
}
