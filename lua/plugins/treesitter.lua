return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter').install({
        'php',
        'phpdoc',
        'html',
        'css',
        'javascript',
        'typescript',
        'tsx',
        'json',
        'lua',
        'python',
        'bash',
        'yaml',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
        'query',
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'php', 'html', 'css', 'javascript', 'javascriptreact',
          'typescript', 'typescriptreact', 'json', 'lua', 'python',
          'sh', 'bash', 'yaml', 'markdown', 'vim',
        },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
