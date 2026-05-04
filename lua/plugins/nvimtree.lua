return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = function()
      require('nvim-tree').setup({
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
            '^.git$',
            '^node_modules$',
            '^vendor$',
            '.DS_Store',
          },
          exclude = {},
        },
        git = {
          enable = false,
        },
        renderer = {
          highlight_git = false,
        },
      })
    end,
  },
}
