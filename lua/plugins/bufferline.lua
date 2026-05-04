return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VimEnter',
    config = function()
      require('bufferline').setup({})
    end,
  },
}
