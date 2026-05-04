# My Cozy Laravel Neovim Setup

This repository is a personal Neovim configuration focused on Laravel and PHP development, with enough JavaScript, TypeScript, Vue, Tailwind, Lua, Python, and shell support to cover common full-stack work.

The current setup is centered on:

- `lazy.nvim` for plugin management
- `coc.nvim` for completion, code actions, diagnostics, and language tooling
- Intelephense for PHP intelligence and formatting
- Telescope for fuzzy finding and search
- `nvim-tree` for file browsing
- `formatter.nvim` for non-PHP formatting
- Tokyo Night, Lualine, Bufferline, and which-key for the UI

## Project Structure

- `init.lua`: the main Neovim entry point. Bootstraps `lazy.nvim` and loads core config and plugins.
- `lua/core/`: general settings, keymaps, and autocommands.
- `lua/plugins/`: individual plugin specs for `lazy.nvim`.
- `coc-settings.json`: CoC and Intelephense settings, including PHP diagnostics, formatting, file associations, and root patterns.
- `lazy-lock.json`: auto-generated lockfile that pins exact plugin versions.
- `README.md`: usage and setup documentation for this repo.

## Prerequisites

Before starting, install the tools this config expects to find on your system.

1. Neovim (`0.8.0` or higher)
   ```bash
   # macOS
   brew install neovim

   # Ubuntu/Debian
   sudo apt install neovim
   ```

2. Node.js (required for CoC and several language servers)
   ```bash
   # macOS
   brew install node

   # Ubuntu/Debian
   curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
   sudo apt install nodejs
   ```

3. Git
   ```bash
   # macOS
   brew install git

   # Ubuntu/Debian
   sudo apt install git
   ```

4. PHP `8.2` (required for the PHP workflow documented here)
   ```bash
   # macOS
   brew install php@8.2

   # Ubuntu/Debian
   sudo apt install php8.2-cli php8.2-mbstring php8.2-xml
   ```

5. Composer (for Laravel projects and root detection)
   ```bash
   # macOS
   brew install composer

   # Ubuntu/Debian
   curl -sS https://getcomposer.org/installer | php
   sudo mv composer.phar /usr/local/bin/composer
   ```

6. `ripgrep` (used by Telescope live grep)
   ```bash
   # macOS
   brew install ripgrep

   # Ubuntu/Debian
   sudo apt install ripgrep
   ```

7. `fd` (used by Telescope file finding)
   ```bash
   # macOS
   brew install fd

   # Ubuntu/Debian
   sudo apt install fd-find
   # On some systems you may need: alias fd=fdfind
   ```

8. Intelephense
   ```bash
   npm install -g intelephense
   ```

9. Formatters used by `formatter.nvim`

   PHP formatting in this config goes through Intelephense via CoC. The `coc-php-cs-fixer` extension is installed, but the default `<Space>Ff` and `<Space>FF` PHP formatting path uses `CocAction('format')`.

   JavaScript, TypeScript, JSON, HTML, CSS, Vue, YAML:
   ```bash
   npm install -g prettier
   ```

   Bash/Shell:
   ```bash
   # macOS
   brew install shfmt

   # Linux
   go install mvdan.cc/sh/v3/cmd/shfmt@latest
   ```

   Lua:
   ```bash
   # macOS
   brew install stylua

   # Linux
   cargo install stylua
   ```

   Python:
   ```bash
   pip install black
   # or
   pip3 install black
   ```

10. Optional: GitHub Copilot
    ```vim
    :Copilot setup
    ```

## Installation

1. Create the Neovim config directory:
   ```bash
   mkdir -p ~/.config/nvim
   ```

2. Copy the contents of this repository into that directory:
   ```bash
   cp -r * ~/.config/nvim/
   ```

3. Open Neovim:
   ```bash
   nvim
   ```

   `lazy.nvim` will bootstrap and install all plugins automatically on first launch. Run `:Lazy` to view the plugin dashboard, or `:Lazy sync` to update.

4. CoC extensions listed in `g:coc_global_extensions` will install automatically when Neovim starts. Verify them with:
   ```vim
   :CocList extensions
   ```

## Configured Features

- Completion, diagnostics, code actions, and navigation through `coc.nvim`
- PHP tooling through Intelephense, Laravel, PHPStan, Blade, and related CoC extensions
- JavaScript and TypeScript support through the CoC TS Server extension
- Vue support through Volar extensions
- Tailwind, HTML, CSS, JSON, YAML, Dotenv, Emmet, snippets, and Vimscript support via CoC extensions
- JavaScript refactoring helpers through `coc-jsref`
- Optional Go language support through `coc-go`
- Telescope fuzzy finding and live grep
- Telescope file browser (`<Space>fe`)
- `nvim-tree` file explorer on the right side
- Tokyo Night with a pure black background override
- Lualine statusline and Bufferline tab-style buffer list
- which-key leader key discovery
- Treesitter parser installation and highlighting startup for selected filetypes
- `formatter.nvim` for JavaScript, TypeScript, JSON, HTML, CSS, Vue, YAML, Python, Shell, Lua, Vim, and generic trailing-whitespace cleanup
- `mini.pairs` and `mini.move`
- `vim-surround`
- Git commands through `vim-fugitive` plus `gitsigns.nvim` gutter signs and CoC Git integration
- CoC extension browsing through `coc-marketplace`
- Optional GitHub Copilot keybindings

## Configured CoC Extensions

This repo currently declares the following extensions in `g:coc_global_extensions`. On a fresh setup, CoC will install this set automatically.

### PHP And Laravel

- `@yaegassy/coc-intelephense`
- `@yaegassy/coc-laravel`
- `@yaegassy/coc-phpstan`
- `coc-blade`
- `coc-php-cs-fixer`

Notes:

- In this repo, the default PHP formatting path still uses Intelephense via `CocAction('format')`.
- `coc-php-cs-fixer` remains installed for PHP CS Fixer / Laravel Pint-related workflows, but it is not the default `<Space>Ff` formatting path.

### Frontend And Web

- `@yaegassy/coc-volar`
- `@yaegassy/coc-volar-tools`
- `coc-css`
- `coc-dotenv`
- `coc-emmet`
- `coc-format-json`
- `coc-html`
- `coc-html-css-support`
- `coc-json`
- `coc-tailwindcss`
- `coc-tsserver`
- `coc-yaml`

Notes:

- JSON support comes from both `coc-json` and `coc-format-json`, but JSON buffer formatting is currently handled by `formatter.nvim`.
- JavaScript, TypeScript, HTML, CSS, Vue, JSON, and YAML formatting are all routed through `formatter.nvim`.

### Editor And Workflow

- `coc-actions`
- `coc-git`
- `coc-jsref`
- `coc-marketplace`
- `coc-snippets`
- `coc-vimlsp`

### Additional Language Support

- `coc-go`

## Key Mappings

Leader is `<Space>`. which-key is configured, so pressing leader will show grouped mappings.

### File Navigation

- `<Space>ff` - Find files with Telescope
- `<Space>fg` - Live grep with Telescope
- `<Space>fb` - List open buffers with Telescope
- `<Space>fh` - Search help tags with Telescope
- `<Space>fe` - Open Telescope file browser
- `<Space>e` - Toggle `nvim-tree`
- `[b` - Previous buffer
- `]b` - Next buffer

### Code Navigation

- `gd` - Go to definition
- `gy` - Go to type definition
- `gi` - Go to implementation
- `gr` - Find references
- `K` - Show hover documentation
- `<C-Space>` in Normal mode - Show hover documentation

### Code Actions And Refactoring

- `<Space>rn` - Rename symbol
- `<Space>ac` - Code action
- `<Space>aC` - Code action at cursor
- `<Space>ac` in Visual mode - Code action for selection

### Diagnostics And CoC Lists

- `<Space>ca` - Show all diagnostics
- `[g` - Previous diagnostic
- `]g` - Next diagnostic
- `<Space>cc` - Show CoC commands
- `<Space>co` - Show outline/symbols

### Window Management

- `<C-Up>` - Move to window above
- `<C-Down>` - Move to window below
- `<C-Left>` - Move to window on the left
- `<C-Right>` - Move to window on the right
- `<Space>qq` - Quit Neovim
- `<Space>bd` - Delete current buffer

### Formatting

- `<Space>Ff` - Format current buffer
- `<Space>FF` - Format current buffer and write it
- `<Space>Fs` in Visual mode - Format selected region through CoC

Notes:

- For most filetypes, `<Space>Ff` and `<Space>FF` use `formatter.nvim`.
- For PHP, formatting delegates to Intelephense via CoC.

### Git

- `<Space>gs` - `:Git`
- `<Space>gb` - `:Git blame`
- `<Space>gd` - `:Gdiffsplit`
- `<Space>gl` - `:Git log`
- `<Space>gc` - `:Git commit`
- `<Space>gp` - `:Git push`
- `<Space>gP` - `:Git pull`
- `<Space>gf` - `:Git fetch`
- `<Space>gr` - `:Gread`
- `<Space>gw` - `:Gwrite`
- `<Space>ge` - `:Gedit`
- `<Space>gm` - `:Git merge`

### Folding

- `<Space>=` - Toggle fold
- `<Space>+` - Open all folds
- `<Space>-` - Close all folds

### Completion In Insert Mode

- `<C-Space>` - Refresh CoC completion
- `<Tab>` - Next completion item, or insert a tab / trigger completion depending on context
- `<S-Tab>` - Previous completion item
- `<CR>` - Confirm completion

### Copilot In Insert Mode

- `<C-J>` - Accept suggestion
- `<C-n>` - Next suggestion
- `<C-p>` - Previous suggestion
- `<C-\>` - Dismiss suggestion

### Other

- `<Esc>` - Clear search highlighting
- `<C-S-Left>`, `<C-S-Right>`, `<C-S-Up>`, `<C-S-Down>` - Move current line or visual selection with `mini.move`

## Supported Languages And Formatters

| Language   | Formatter / Method     | Notes |
|------------|-------------------------|-------|
| PHP        | Intelephense via CoC    | Uses `CocAction('format')`; brace style and PHP settings live in `coc-settings.json`. |
| JavaScript | Prettier                | Via `formatter.nvim` |
| TypeScript | Prettier                | Via `formatter.nvim` |
| JSON       | Prettier                | Via `formatter.nvim` |
| HTML       | Prettier                | Via `formatter.nvim` |
| CSS        | Prettier                | Via `formatter.nvim` |
| Vue        | Prettier                | Via `formatter.nvim` |
| YAML       | Prettier                | Via `formatter.nvim` |
| Python     | Black                   | Via `formatter.nvim` |
| Bash/Shell | shfmt                   | Via `formatter.nvim` |
| Lua        | StyLua                  | Via `formatter.nvim` |
| Vim        | Built-in whitespace fix | Removes trailing whitespace via `formatter.nvim` |
| Others     | Built-in whitespace fix | Removes trailing whitespace via `formatter.nvim` |

## Behavior Notes

- Telescope `live_grep` includes hidden files and uses `--no-ignore-vcs`, while excluding `.git`, `node_modules`, `vendor`, `*.lock`, and ripgrep filetypes such as `sql` and `json`.
- Telescope `find_files` uses `fd`, and Telescope pickers ignore `.git`, `node_modules`, `vendor`, `storage/framework`, and `storage/logs`.
- `nvim-tree` opens on the right at width `60`.
- `nvim-tree` keeps dotfiles visible, but filters `.git`, `node_modules`, `vendor`, and `.DS_Store`.
- Tokyo Night colors are overridden so the background is pure black.
- Treesitter parsers are installed through `require('nvim-treesitter').install(...)`, and highlighting is started with `vim.treesitter.start()` on selected filetypes.
- PHP project roots are detected from `composer.json`, `.git/`, or `artisan`.

## Customization

This configuration currently includes:

- Case-insensitive search with smartcase
- Four-space indentation (`tabstop`, `softtabstop`, and `shiftwidth` are all `4`)
- Relative line numbers
- Cursor line highlighting
- Persistent undo
- System clipboard integration through `unnamedplus`
- Mouse support in all modes
- Split windows opening below and to the right
- Folding by indentation with folds open by default

## Performance Optimizations

The config includes several performance-oriented defaults:

- `synmaxcol=3000` to limit syntax work on extremely long lines
- `redrawtime=10000` to allow more time for complex highlighting
- `maxmempattern=2000000` for larger pattern-matching limits
- `re=0` to use the newer regexp engine
- `updatetime=300` for faster feedback from completion and diagnostics
- `g:coc_node_args = ['--max-old-space-size=8192']` to give CoC more memory

## Plugin Management

Plugins are managed by `lazy.nvim`. Open the dashboard with:

```vim
:Lazy
```

Useful commands:
- `:Lazy sync` - install, clean, and update all plugins
- `:Lazy update` - update all plugins
- `:Lazy profile` - view startup time breakdown
- `:Lazy clean` - remove unused plugins

The `lazy-lock.json` file pins exact plugin versions. Commit it to version control to keep setups reproducible.

## Troubleshooting

### Missing Plugins

- Run `:Lazy sync`
- Restart Neovim

### CoC Errors

- Make sure Node.js is installed and on your `PATH`
- Run `:CocInfo`
- Run `:CocList extensions`
- If needed, install or update extensions with `:CocInstall` or `:CocUpdate`
- Confirm `coc-settings.json` is located at `~/.config/nvim/coc-settings.json`

### Telescope Search Not Working

- Verify `rg` and `fd` are installed and on your `PATH`
- Check `rg --version` and `fd --version`

### Formatting Not Working

- Check that the external formatter for your language is installed and on your `PATH`
- Use `<Space>Ff` to format the current buffer
- Use `<Space>FF` to format and write the buffer
- Use `<Space>Fs` in Visual mode to format a selected region through CoC
- For PHP, verify Intelephense is active with `:CocList extensions`
- For PHP-specific issues, inspect `:CocInfo` and `:CocOpenLog`
- For `formatter.nvim` issues, inspect `:messages`

### Icons Not Showing

- Install and use a Nerd Font in your terminal emulator

### UI Problems

- Run `:messages` and look for startup Lua errors
- Run `:Lazy sync` if a plugin is missing

### General Health Checks

- `:messages`
- `:CocInfo`
- `:CocOpenLog`
- `:checkhealth`

## Support

If something is off:

1. Run `:checkhealth`
2. Confirm the prerequisites above are installed
3. Verify your Neovim version with `:version`
