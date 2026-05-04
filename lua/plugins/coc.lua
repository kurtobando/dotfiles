return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    event = 'VimEnter',
    config = function()
      vim.g.coc_global_extensions = {
        '@yaegassy/coc-intelephense',
        '@yaegassy/coc-laravel',
        '@yaegassy/coc-phpstan',
        '@yaegassy/coc-volar',
        '@yaegassy/coc-volar-tools',
        'coc-actions',
        'coc-blade',
        'coc-css',
        'coc-dotenv',
        'coc-emmet',
        'coc-git',
        'coc-go',
        'coc-html',
        'coc-html-css-support',
        'coc-jsref',
        'coc-json',
        'coc-marketplace',
        'coc-tailwindcss',
        'coc-tsserver',
        'coc-vimlsp',
        'coc-yaml',
        'coc-snippets',
        'coc-format-json',
        'coc-php-cs-fixer',
      }
      vim.g.coc_node_args = { '--max-old-space-size=8192' }
    end,
  },
}
