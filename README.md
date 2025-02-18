# My Cozy Laravel Neovim Setup

Hey there! 👋 This is my carefully crafted Neovim configuration that I've been using and refining while working on Laravel projects. After trying countless setups and configurations, this one finally feels just right - it's fast, smart, and makes Laravel development a breeze.

What makes it special? It's got everything I need for Laravel work - from super-smart PHP completion to Blade template support, and it handles all those little things that used to slow me down. And yes, it works great with Tailwind CSS too!

I originally built this for myself, but figured it might help other Laravel devs who want to give Neovim a shot. Trust me, once you get this set up, you'll wonder how you ever coded Laravel projects without it.

## Prerequisites

Before starting, make sure you have the following installed:

1. Neovim (version 0.8.0 or higher)
   ```bash
   # For macOS (using Homebrew)
   brew install neovim

   # For Ubuntu/Debian
   sudo apt install neovim

   # For Windows (using Chocolatey)
   choco install neovim
   ```

2. Node.js (required for CoC)
   ```bash
   # For macOS
   brew install node

   # For Ubuntu/Debian
   curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
   sudo apt install nodejs

   # For Windows
   choco install nodejs
   ```

3. Git
   ```bash
   # For macOS
   brew install git

   # For Ubuntu/Debian
   sudo apt install git

   # For Windows
   choco install git
   ```

4. Ripgrep (for better search functionality)
   ```bash
   # For macOS
   brew install ripgrep

   # For Ubuntu/Debian
   sudo apt install ripgrep

   # For Windows
   choco install ripgrep
   ```

## Installation

1. First, install vim-plug (Plugin Manager):
   ```bash
   # For Unix (Linux/macOS)
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

   # For Windows (PowerShell)
   iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
       ni "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" -Force
   ```

2. Create the Neovim configuration directory:
   ```bash
   # For Unix (Linux/macOS)
   mkdir -p ~/.config/nvim

   # For Windows
   mkdir $env:LOCALAPPDATA\nvim
   ```

3. Copy the provided `init.vim` into your Neovim configuration directory:
   ```bash
   # For Unix (Linux/macOS)
   cp init.vim ~/.config/nvim/

   # For Windows
   copy init.vim $env:LOCALAPPDATA\nvim\
   ```

4. Open Neovim and install plugins:
   ```bash
   nvim
   ```
   Then inside Neovim, run:
   ```
   :PlugInstall
   ```

5. Install CoC extensions (this will happen automatically when you open Neovim)

## Features

- 🧠 Intelligent code completion (CoC + Copilot)
- 🔍 Fuzzy file finding and searching (Telescope)
- 📁 File explorer (nvim-tree)
- 🎨 Beautiful UI with Tokyo Night theme
- 📦 Auto-pairs and surround functionality
- 🔄 Better syntax highlighting (TreeSitter)
- ⚡ Fast and efficient performance optimizations

## Key Mappings

Space is the leader key. Here are some essential keybindings to get you started:

### File Navigation
- `<Space>ff` - Find files
- `<Space>fg` - Live grep (search in files)
- `<Space>fb` - Browse buffers
- `<Space>e` - Toggle file explorer

### Code Navigation
- `gd` - Go to definition
- `gy` - Go to type definition
- `gi` - Go to implementation
- `gr` - Find references
- `K` - Show documentation

### Window Management
- `Ctrl + Arrow Keys` - Navigate between windows
- `<Space>qq` - Quit
- `<Space>bd` - Close buffer
- `[b` and `]b` - Previous/Next buffer

### Code Completion
- `Ctrl + Space` - Trigger completion
- `Tab` - Navigate completion menu
- `Enter` - Select completion

### Copilot
- `Ctrl + J` - Accept suggestion
- `Ctrl + n` - Next suggestion
- `Ctrl + p` - Previous suggestion
- `Ctrl + \` - Dismiss suggestion

### Code Actions
- `<Space>ac` - Code action menu
- `<Space>fm` - Format file

## Customization

The configuration includes:
- Case-insensitive search
- 4-space indentation
- Line numbers with relative numbering
- True color support
- Mouse support in all modes
- System clipboard integration
- Persistent undo history

## Troubleshooting

1. If you see errors about missing plugins:
   - Run `:PlugInstall` inside Neovim
   - Restart Neovim

2. If CoC shows errors:
   - Make sure Node.js is installed
   - Run `:CocInfo` to check CoC status
   - Run `:CocInstall [extension]` for any missing extensions

3. If file icons are not showing:
   - Make sure you have a Nerd Font installed and configured in your terminal

4. If Telescope search is not working:
   - Verify that ripgrep is installed
   - Run `rg --version` in your terminal to confirm

For more detailed troubleshooting, check the error messages in:
- `:messages`
- `:CocInfo`
- `:checkhealth`

## Support

If you encounter any issues:
1. Run `:checkhealth` inside Neovim to diagnose common problems
2. Check if all prerequisites are installed correctly
3. Make sure your Neovim version is 0.8.0 or higher (`:version`)
