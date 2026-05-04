return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        transparent = false,
        styles = {
          sidebars = 'dark',
          floats = 'dark',
          keywords = {
            italic = false,
          },
        },
        on_colors = function(colors)
          colors.bg = '#000000'
          colors.bg_dark = '#000000'
          colors.bg_float = '#000000'
          colors.bg_popup = '#000000'
          colors.bg_sidebar = '#000000'
          colors.bg_statusline = '#000000'
        end,
        on_highlights = function(hl, c)
          hl['@comment.php'] = {
            fg = '#636da6',
          }
        end,
      })
      vim.cmd('colorscheme tokyonight-night')
    end,
  },
}
