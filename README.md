# My Cozy Laravel Neovim Setup

Hey there! 👋 This is my carefully crafted Neovim configuration that I've been using and refining while working on Laravel projects. After trying countless setups and configurations, this one finally feels just right - it's fast, smart, and makes Laravel development a breeze.

What makes it special? It's got everything I need for Laravel work - from super-smart PHP completion (thanks to Intelephense via CoC) to Blade template support, and it handles all those little things that used to slow me down. And yes, it works great with Tailwind CSS too!

I originally built this for myself, but figured it might help other Laravel devs who want to give Neovim a shot. Feel free to fork this repository and customize it to your liking.

## Prerequisites

Before starting, make sure you have the following installed:

1.  Neovim (version 0.8.0 or higher)
    ```bash
    # For macOS (using Homebrew)
    brew install neovim

    # For Ubuntu/Debian
    sudo apt install neovim
    ```

2.  Node.js (required for CoC)
    ```bash
    # For macOS
    brew install node

    # For Ubuntu/Debian
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install nodejs
    ```

3.  Git
    ```bash
    # For macOS
    brew install git

    # For Ubuntu/Debian
    sudo apt install git
    ```

4.  Ripgrep (for better search functionality with Telescope)
    ```bash
    # For macOS
    brew install ripgrep

    # For Ubuntu/Debian
    sudo apt install ripgrep
    ```

5.  Code formatters (for `formatter.nvim` and PHP LSP formatting):
    *   **PHP**: Formatting is handled by **Intelephense** (via CoC language server). Its style (e.g., brace style set to `per`, which is K&R style) is configured within `coc-settings.json` (see `intelephense.format.braces`). Ensure `@yaegassy/coc-intelephense` CoC extension is installed. You can still use project-specific tools like Laravel Pint or PHP-CS-Fixer independently.
    ```bash
    # Example: If you want PHP-CS-Fixer globally for other uses
    # composer global require friendsofphp/php-cs-fixer
    ```
    *   **JavaScript, TypeScript, JSON, HTML, CSS, Vue, YAML** (Prettier)
    ```bash
    npm install -g prettier
    ```
    *   **Bash/Shell** (shfmt)
    ```bash
    # macOS
    brew install shfmt
    # Linux (Go needs to be installed)
    # Ensure Go is installed, then:
    go install mvdan.cc/sh/v3/cmd/shfmt@latest
    ```
    *   **Lua** (StyLua)
    ```bash
    # macOS
    brew install stylua
    # Linux (Rust/Cargo needs to be installed)
    # Ensure Rust/Cargo is installed, then:
    cargo install stylua
    ```
    *   **Python** (Black)
    ```bash
    pip install black
    # or
    pip3 install black
    ```

6.  (Optional) Github Copilot. If you want to use Copilot, you can follow the installation setup. https://github.com/github/copilot.vim
    ```bash
    # Start setup
    :Copilot setup
    ```

## Installation

1.  First, install vim-plug (Plugin Manager):
    ```bash
    # For Unix (Linux/macOS)
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ```

2.  Create the Neovim configuration directory:
    ```bash
    # For Unix (Linux/macOS)
    mkdir -p ~/.config/nvim
    ```

3.  Copy the provided `init.vim` and `coc-settings.json` into your Neovim configuration directory:
    ```bash
    # For Unix (Linux/macOS)
    cp init.vim coc-settings.json ~/.config/nvim/
    ```
    *(Ensure `coc-settings.json` is placed in `~/.config/nvim/coc-settings.json` for CoC to pick it up automatically. If CoC looks for it in a different location, you might need to adjust or symlink it).*

4.  Open Neovim and install plugins:
    ```bash
    nvim
    ```
    Then inside Neovim, run:
    ```
    :PlugInstall
    ```

5.  Install CoC extensions (this will happen automatically when you open Neovim, based on `g:coc_global_extensions` in `init.vim`). You can verify with `:CocList extensions`.

## Features

-   🧠 Intelligent code completion (CoC + Intelephense for PHP, TSServer for JS/TS, Copilot for AI suggestions)
-   🔍 Fuzzy file finding and searching (Telescope with `fd` and `ripgrep`)
-   📁 File explorer (nvim-tree)
-   🎨 Beautiful UI with Tokyo Night theme and Bufferline for tab-like buffer management
-   🌟 Enhanced status line (Lualine)
-   ♨️ Git integration in the gutter (Gitsigns)
-   💡 Function signature help (`lsp_signature.nvim`)
-   📦 Auto-pairs (`mini.pairs`) and surround functionality (`vim-surround`)
-   ↕️ Easy line and visual selection moving (`mini.move`)
-   🔄 Better syntax highlighting (TreeSitter)
-   ⚡ Fast and efficient performance optimizations
-   🔨 Powerful multi-language code formatting (`formatter.nvim` for many languages, CoC/Intelephense for PHP)

## Key Mappings

Space is the leader key. Here are some essential keybindings to get you started:

### File Navigation
-   `<Space>ff` - Find files (Telescope)
-   `<Space>fg` - Live grep (search in files with Telescope)
-   `<Space>fb` - Browse buffers (Telescope)
-   `<Space>fh` - Browse help tags (Telescope)
-   `<Space>e` - Toggle file explorer (nvim-tree)

### Code Navigation
-   `gd` - Go to definition (CoC)
-   `gy` - Go to type definition (CoC)
-   `gi` - Go to implementation (CoC)
-   `gr` - Find references (CoC)
-   `K` or `<C-Space>` (in Normal mode) - Show documentation/hover (CoC)

### Code Editing & Refactoring
-   `<Space>rn` - Rename symbol (CoC)
-   `<Space>ac` - Code action menu
-   `<Space>aC` - Code action menu at cursor
-   `<Space>ac` (in Visual mode) - Code action for selected region

### Diagnostics & Debugging
-   `<Space>a` - Show all diagnostics (CoC)
-   `[g` - Go to previous diagnostic
-   `]g` - Go to next diagnostic

### Window Management
-   `Ctrl + Up/Down/Left/Right` - Navigate between windows
-   `<Space>qq` - Quit Neovim
-   `<Space>bd` - Close current buffer
-   `[b` and `]b` - Previous/Next buffer

### Code Completion (CoC)
-   `Ctrl + Space` (in Insert mode) - Trigger completion / Refresh completion
-   `Tab` / `Shift + Tab` - Navigate completion menu
-   `Enter` - Select completion

### Code Formatting
-   `<Space>f` - Format current buffer:
    -   For PHP files: Uses CoC/Intelephense (due to an `autocmd` calling `CocAction('format')`).
    -   For other filetypes: Uses `formatter.nvim` (via the `:Format` command).
-   `<Space>F` - Format current buffer and save:
    -   For PHP files: Uses CoC/Intelephense (as `formatter.nvim`'s PHP setup calls `vim.lsp.buf.format()`) and then saves.
    -   For other filetypes: Uses `formatter.nvim` (via the `:FormatWrite` command) and then saves.
-   `<Space>fs` (in Visual mode) - Format selected region using CoC (`<Plug>(coc-format-selected)`).

### Line & Selection Moving (`mini.move`)
-   `Ctrl + Shift + Up/Down/Left/Right` - Move current line or visual selection

### Copilot
-   `Ctrl + J` - Accept suggestion
-   `Ctrl + n` - Next suggestion
-   `Ctrl + p` - Previous suggestion
-   `Ctrl + \` - Dismiss suggestion

### Search & Navigation
-   `Esc` - Clear search highlighting
-   `<Space>c` - Show CoC commands
-   `<Space>o` - Show symbols/outline (CoC)

## Supported Languages and Formatters

The configuration includes formatting support for:

| Language   | Formatter / Method       | Notes                                                     |
|------------|--------------------------|-----------------------------------------------------------|
| PHP        | Intelephense (via CoC)   | Uses LSP formatting. Style (e.g., brace style `per`) configured in `coc-settings.json`. |
| JavaScript | Prettier                 | Via `formatter.nvim`                                      |
| TypeScript | Prettier                 | Via `formatter.nvim`                                      |
| JSON       | Prettier                 | Via `formatter.nvim`                                      |
| HTML       | Prettier                 | Via `formatter.nvim`                                      |
| CSS        | Prettier                 | Via `formatter.nvim`                                      |
| Vue        | Prettier                 | Via `formatter.nvim`                                      |
| YAML       | Prettier                 | Via `formatter.nvim`                                      |
| Python     | Black                    | Via `formatter.nvim`                                      |
| Bash/Shell | shfmt                    | Via `formatter.nvim`                                      |
| Lua        | StyLua                   | Via `formatter.nvim`                                      |
| Vim        | Built-in                 | Removes trailing whitespace via `formatter.nvim`          |
| Others     | Built-in                 | Removes trailing whitespace via `formatter.nvim`          |

## Customization

The configuration includes:
-   Case-insensitive search (smartcase enabled)
-   4-space indentation (softtabstop, shiftwidth, tabstop all set to 4)
-   Line numbers with relative numbering
-   True color support (`termguicolors`)
-   Mouse support in all modes
-   System clipboard integration (`unnamedplus`)
-   Persistent undo history
-   Tokyo Night theme with custom background color set to pure black.

## Troubleshooting

1.  **Missing Plugins**:
    *   Run `:PlugInstall` inside Neovim.
    *   Restart Neovim.

2.  **CoC Errors or Issues**:
    *   Ensure Node.js is installed and accessible.
    *   Run `:CocInfo` to check CoC status and paths.
    *   Run `:CocList extensions` to see installed CoC extensions. If `@yaegassy/coc-intelephense` or other expected extensions are missing or have errors, try `:CocInstall @yaegassy/coc-intelephense` or `:CocUpdate` for all.
    *   Check `coc-settings.json` is correctly placed (e.g., `~/.config/nvim/coc-settings.json`).

3.  **File Icons Not Showing (nvim-tree, Telescope, etc.)**:
    *   Make sure you have a Nerd Font installed and configured in your terminal emulator.

4.  **Telescope Search Not Working**:
    *   Verify `ripgrep` (for `live_grep`) and `fd` (for `find_files`, optional but recommended in config) are installed and in your `PATH`.
    *   Run `rg --version` and `fd --version` in your terminal to confirm.

5.  **Code Formatting Isn't Working**:
    *   Check if the required global formatters (Prettier, shfmt, Black, StyLua) are installed and in your `PATH`. See "Prerequisites" section.
    *   For PHP:
        *   Ensure `@yaegassy/coc-intelephense` CoC extension is active (`:CocList extensions`).
        *   Formatting is handled by the Intelephense language server. Check `:CocInfo` for LSP status and `:CocOpenLog` for Intelephense-specific messages or errors.
        *   The `coc-settings.json` file configures Intelephense; ensure it's loaded.
    *   For other languages (using `formatter.nvim`):
        *   The keymaps `<Space>f` (runs `:Format`) and `<Space>F` (runs `:FormatWrite` and saves) use `formatter.nvim` for full buffer formatting.
        *   For formatting a visual selection, use `<Space>fs` which uses CoC.
        *   If `formatter.nvim` isn't working as expected with `<Space>f` or `<Space>F`, check `:messages` for any errors from `formatter.nvim`.
        *   You can increase `formatter.nvim` log level in `init.vim` for more details if needed.

6.  **UI Elements (Lualine, Bufferline) Missing/Broken**:
    *   Ensure plugins are installed (`:PlugInstall`).
    *   Check `:messages` for any Lua errors related to these plugins during startup.

For more detailed troubleshooting, check the output of:
-   `:messages`
-   `:CocInfo`
-   `:CocOpenLog` (for CoC related issues)
-   `:checkhealth` (provides diagnostics for Neovim and some plugins)

## Support

If you encounter any issues:
1.  Run `:checkhealth` inside Neovim to diagnose common problems.
2.  Check if all prerequisites are installed correctly.
3.  Make sure your Neovim version is 0.8.0 or higher (`:version`).