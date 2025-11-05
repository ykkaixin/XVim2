# Modern Neovim Configuration

A comprehensive, modern Neovim configuration with Python support, intelligent autocomplete, fuzzy search, AI-powered suggestions, and more. Designed to be portable and easy to set up on any new computer.

## Features

### Core Features
- **Modern Lua Configuration**: Fast and maintainable configuration written in Lua
- **Plugin Management**: Lazy.nvim for efficient plugin loading
- **Beautiful UI**: TokyoNight color scheme, lualine status bar, and bufferline
- **File Explorer**: Nvim-tree with icons and git integration
- **Git Integration**: Gitsigns for inline git status

### Developer Experience
- **Python LSP**: Full Python support with Pyright
  - Intelligent autocomplete
  - Type checking
  - Go to definition/references
  - Inline documentation
  - Code actions and refactoring

- **Fuzzy Finding**: Telescope for blazing-fast file and text search
  - Find files by name
  - Search content across project (live grep)
  - Browse recent files
  - Search symbols and diagnostics

- **Smart Autocompletion**: nvim-cmp with multiple sources
  - LSP-based completions
  - Snippet support
  - Buffer and path completions
  - Beautiful completion menu with icons

- **AI Autocomplete**: Codeium integration (free GitHub Copilot alternative)
  - Intelligent code suggestions
  - Context-aware completions
  - Multi-language support

### Additional Features
- **Treesitter**: Advanced syntax highlighting and code understanding
- **Auto Pairs**: Automatic bracket/quote pairing
- **Comment Plugin**: Easy code commenting (gcc, gbc)
- **Indent Guides**: Visual indent markers
- **Which-Key**: Discoverable keybindings
- **Multiple LSP Servers**: Support for Python, Lua, TypeScript, HTML, CSS, JSON, Bash

## Prerequisites

Before installation, ensure you have:

- **Neovim** >= 0.9.0 (required)
  - macOS: `brew install neovim`
  - Ubuntu: `sudo apt install neovim`
  - Arch: `sudo pacman -S neovim`
  - Fedora: `sudo dnf install neovim`

- **Git** (required)

- **Python 3** with pip (for Python development)

- **Node.js** >= 16 (for LSP servers)
  - Download from: https://nodejs.org/

- **ripgrep** (recommended for Telescope live grep)
  - macOS: `brew install ripgrep`
  - Ubuntu: `apt install ripgrep`

- **fd** (optional but recommended for Telescope)
  - macOS: `brew install fd`
  - Ubuntu: `apt install fd-find`

## Installation

### Quick Install (Recommended)

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/nvim-config.git
   cd nvim-config
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

3. Launch Neovim:
   ```bash
   nvim
   ```

On first launch, plugins will automatically install. This may take a few minutes.

### Manual Installation

1. Backup your existing Neovim configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Clone this repository to your Neovim config directory:
   ```bash
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
   ```

3. Launch Neovim and wait for plugins to install:
   ```bash
   nvim
   ```

## Post-Installation Setup

### 1. Install LSP Servers

LSP servers will be automatically installed by Mason when you first open relevant file types. You can also manually install them:

```
:Mason
```

Navigate and press `i` to install:
- `pyright` - Python LSP
- `lua_ls` - Lua LSP
- `tsserver` - TypeScript/JavaScript LSP

### 2. Setup AI Autocomplete (Codeium)

Codeium is a free AI-powered autocomplete tool:

1. In Neovim, run:
   ```
   :Codeium Auth
   ```

2. Follow the authentication instructions in your browser
3. Return to Neovim and start coding!

## Usage

### Key Bindings

The leader key is `<Space>`.

#### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Quit all without saving
- `jk` - Exit insert mode

#### File Explorer
- `<leader>e` - Toggle file explorer
- `<leader>ef` - Find current file in explorer
- `<leader>ec` - Collapse all folders
- `<leader>er` - Refresh explorer

#### Fuzzy Finding (Telescope)
- `<leader>ff` - Find files
- `<leader>fr` - Recent files
- `<leader>fs` - Search text in files (live grep)
- `<leader>fc` - Find word under cursor
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>fd` - Find diagnostics

#### LSP Features
- `K` - Show hover documentation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - Show references
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>f` - Format document
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>d` - Show diagnostic float

#### Autocompletion
- `<C-Space>` - Trigger completion
- `<C-j>` - Next suggestion
- `<C-k>` - Previous suggestion
- `<Tab>` - Next item / expand snippet
- `<S-Tab>` - Previous item
- `<CR>` - Confirm selection

#### AI Autocomplete (Codeium)
- `<C-g>` - Accept AI suggestion
- `<C-]>` - Next suggestion
- `<C-[>` - Previous suggestion
- `<C-x>` - Clear suggestion

#### Window Management
- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<leader>se` - Make splits equal size
- `<leader>sx` - Close current split
- `<C-h/j/k/l>` - Navigate between splits

#### Buffers
- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer
- `<leader>bd` - Delete buffer

#### Comments
- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- (Visual mode) `gc` - Comment selection

## Configuration Structure

```
.
├── init.lua                   # Main entry point
├── lua/
│   ├── core/
│   │   ├── options.lua       # Neovim options
│   │   └── keymaps.lua       # General keybindings
│   └── plugins/
│       ├── init.lua          # Plugin manager setup
│       ├── lsp.lua           # LSP configuration
│       ├── cmp.lua           # Completion configuration
│       ├── telescope.lua     # Fuzzy finder configuration
│       ├── treesitter.lua    # Syntax highlighting
│       ├── nvim-tree.lua     # File explorer
│       └── ai.lua            # AI autocomplete
├── install.sh                # Installation script
└── README.md                 # This file
```

## Customization

### Changing Color Scheme

Edit `lua/plugins/init.lua` and modify the color scheme plugin:

```lua
{
  "folke/tokyonight.nvim",
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
}
```

Popular alternatives:
- `catppuccin/nvim` - Catppuccin
- `EdenEast/nightfox.nvim` - Nightfox
- `navarasu/onedark.nvim` - One Dark

### Adding More LSP Servers

Edit `lua/plugins/lsp.lua` and add to `ensure_installed`:

```lua
ensure_installed = {
  "pyright",
  "rust_analyzer",  -- Add Rust support
  "gopls",          -- Add Go support
  -- etc.
}
```

### Modifying Options

Edit `lua/core/options.lua` to change Neovim behavior:
- Tab size
- Line numbers
- Scroll offset
- And more...

## Updating

### If Installed via Symlink

```bash
cd /path/to/nvim-config
git pull
```

Then in Neovim: `:Lazy sync`

### If Copied Configuration

```bash
cd /path/to/nvim-config
git pull
cp -r init.lua lua ~/.config/nvim/
```

Then in Neovim: `:Lazy sync`

## Troubleshooting

### Plugins Not Loading

Try reinstalling plugins:
```
:Lazy clean
:Lazy sync
```

### LSP Not Working

1. Check if LSP server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Reinstall LSP server in Mason

### Python LSP Issues

Ensure Python and pip are installed:
```bash
python3 --version
pip3 --version
```

### Fuzzy Search Not Working

Install ripgrep:
- macOS: `brew install ripgrep`
- Linux: `apt install ripgrep` or `pacman -S ripgrep`

### AI Autocomplete Not Working

1. Authenticate Codeium: `:Codeium Auth`
2. Check status: `:Codeium Status`

## Performance Tips

1. **Lazy Loading**: Most plugins are already configured for lazy loading
2. **Treesitter**: Only installs parsers for languages you use
3. **LSP**: LSP servers only load for relevant file types
4. **Disable Unused Plugins**: Comment out plugins you don't use in `lua/plugins/init.lua`

## Contributing

Feel free to customize this configuration to your needs! If you make improvements, consider sharing them.

## Credits

This configuration uses many excellent plugins from the Neovim community:
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [Codeium](https://github.com/Exafunction/codeium.vim) - AI autocomplete
- And many more!

## License

MIT License

---

**Happy Coding!** 🚀
