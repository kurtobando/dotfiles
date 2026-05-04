return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')
      wk.setup({
        preset = 'modern',
        delay = 100,
      })

      wk.add({
        { '<leader>f', group = 'find' },
        { '<leader>F', group = 'format' },
        { '<leader>q', group = 'quit' },
        { '<leader>b', group = 'buffer' },
        { '<leader>a', group = 'actions/code' },
        { '<leader>r', group = 'rename' },
        { '<leader>c', group = 'coc' },
        { '<leader>g', group = 'git' },
        { '<leader>h', group = 'hunk' },
        { 'g', group = 'goto' },

        -- Visual mode groups
        { '<leader>ac', desc = 'Code Action on Selection', mode = 'v' },
        { '<leader>Fs', desc = 'Format Selected', mode = 'v' },

        -- Insert mode Copilot hints
        { '<C-J>', desc = 'Accept Copilot suggestion', mode = 'i' },
        { '<C-n>', desc = 'Next Copilot suggestion', mode = 'i' },
        { '<C-p>', desc = 'Previous Copilot suggestion', mode = 'i' },
        { '<C-\\>', desc = 'Dismiss Copilot', mode = 'i' },
        { '<C-Space>', desc = 'Trigger completion', mode = 'i' },
      })
    end,
  },
}
