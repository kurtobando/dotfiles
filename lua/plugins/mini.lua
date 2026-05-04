return {
  {
    'echasnovski/mini.nvim',
    branch = 'stable',
    event = 'VeryLazy',
    config = function()
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
          left = '<C-S-Left>',
          right = '<C-S-Right>',
          down = '<C-S-Down>',
          up = '<C-S-Up>',
          line_left = '<C-S-Left>',
          line_right = '<C-S-Right>',
          line_down = '<C-S-Down>',
          line_up = '<C-S-Up>',
        },
        options = {
          reindent_linewise = true,
        },
      })
    end,
  },
}
