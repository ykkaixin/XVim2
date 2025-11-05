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

## Prerequisites Installation

This configuration requires several tools. Follow the installation commands for your operating system:

### 1. Neovim (>= 0.9.0) - Required

**macOS:**
```bash
brew install neovim
```

**Ubuntu/Debian:**
```bash
# For latest version, use snap or AppImage
sudo snap install nvim --classic

# Or build from source for latest features:
# sudo apt install ninja-build gettext cmake unzip curl
# git clone https://github.com/neovim/neovim
# cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
# sudo make install
```

**Arch Linux:**
```bash
sudo pacman -S neovim
```

**Fedora/RHEL:**
```bash
sudo dnf install neovim
```

**Windows:**
```powershell
# Using Chocolatey
choco install neovim

# Or download from: https://github.com/neovim/neovim/releases
```

### 2. Git - Required

**macOS:**
```bash
brew install git
```

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install git
```

**Arch Linux:**
```bash
sudo pacman -S git
```

**Fedora/RHEL:**
```bash
sudo dnf install git
```

**Windows:**
```powershell
# Download from: https://git-scm.com/download/win
# Or use Chocolatey:
choco install git
```

### 3. Python 3 with pip - Required for Python Development

**macOS:**
```bash
brew install python3
```

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

**Arch Linux:**
```bash
sudo pacman -S python python-pip
```

**Fedora/RHEL:**
```bash
sudo dnf install python3 python3-pip
```

**Windows:**
```powershell
# Download from: https://www.python.org/downloads/
# Or use Chocolatey:
choco install python
```

### 4. Node.js (>= 16) - Required for LSP Servers

**macOS:**
```bash
brew install node
```

**Ubuntu/Debian:**
```bash
# Using NodeSource repository for latest version
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
```

**Arch Linux:**
```bash
sudo pacman -S nodejs npm
```

**Fedora/RHEL:**
```bash
sudo dnf install nodejs npm
```

**Windows:**
```powershell
# Download from: https://nodejs.org/
# Or use Chocolatey:
choco install nodejs
```

### 5. ripgrep - Recommended for Fuzzy Search

**macOS:**
```bash
brew install ripgrep
```

**Ubuntu/Debian:**
```bash
sudo apt install ripgrep
```

**Arch Linux:**
```bash
sudo pacman -S ripgrep
```

**Fedora/RHEL:**
```bash
sudo dnf install ripgrep
```

**Windows:**
```powershell
choco install ripgrep
```

### 6. fd - Optional but Recommended

**macOS:**
```bash
brew install fd
```

**Ubuntu/Debian:**
```bash
sudo apt install fd-find
# Create alias (fd-find is named fd-find on Debian/Ubuntu)
echo 'alias fd=fdfind' >> ~/.bashrc
source ~/.bashrc
```

**Arch Linux:**
```bash
sudo pacman -S fd
```

**Fedora/RHEL:**
```bash
sudo dnf install fd-find
```

**Windows:**
```powershell
choco install fd
```

### 7. Build Tools (for Telescope fzf-native)

**macOS:**
```bash
# Xcode Command Line Tools (usually already installed)
xcode-select --install
```

**Ubuntu/Debian:**
```bash
sudo apt install build-essential
```

**Arch Linux:**
```bash
sudo pacman -S base-devel
```

**Fedora/RHEL:**
```bash
sudo dnf groupinstall "Development Tools"
```

**Windows:**
```powershell
# Install Visual Studio Build Tools or MinGW
choco install mingw
```

### Quick Install All Prerequisites

**macOS (using Homebrew):**
```bash
brew install neovim git python3 node ripgrep fd
xcode-select --install
```

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install -y neovim git python3 python3-pip python3-venv ripgrep fd-find build-essential
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
```

**Arch Linux:**
```bash
sudo pacman -S neovim git python python-pip nodejs npm ripgrep fd base-devel
```

**Fedora/RHEL:**
```bash
sudo dnf install -y neovim git python3 python3-pip nodejs npm ripgrep fd-find
sudo dnf groupinstall "Development Tools"
```

## Installation

### Quick Install (Recommended)

1. Clone this repository:
   ```bash
   git clone https://github.com/ykkaixin/vimrc.git
   cd vimrc
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
   git clone https://github.com/ykkaixin/vimrc.git ~/.config/nvim
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

## Components Guide

本配置包含多个强大的组件，每个组件都有特定的用途。下面详细介绍各组件的功能和使用方法。

### 📦 核心组件详解

#### 1. Lazy.nvim - 插件管理器

**作用：** 管理和加载所有插件，支持懒加载以提升启动速度

**使用方法：**
```vim
:Lazy              " 打开插件管理界面
:Lazy sync         " 同步插件（安装/更新/清理）
:Lazy update       " 更新所有插件
:Lazy clean        " 清理未使用的插件
:Lazy profile      " 查看插件加载性能
```

**常见操作：**
- 在 Lazy 界面按 `I` 安装插件
- 按 `U` 更新插件
- 按 `X` 清理插件
- 按 `?` 查看帮助

---

#### 2. LSP (Language Server Protocol) - 智能语言支持

**作用：** 提供类似 IDE 的智能功能，包括代码补全、跳转定义、错误检查等

**支持的语言：**
- Python (Pyright)
- Lua (lua_ls)
- TypeScript/JavaScript (tsserver)
- HTML, CSS, JSON, Bash

**核心功能：**

1. **代码补全：** 输入时自动显示建议
   ```
   示例：输入 import num 会自动建议 numpy
   ```

2. **跳转定义：** 光标放在函数/变量上按 `gd`
   ```python
   def calculate(x):  # <- 按 gd 跳到这里
       return x * 2

   result = calculate(10)  # <- 光标在这里
   ```

3. **显示文档：** 光标放在函数上按 `K`
   ```python
   print()  # <- 光标在这里按 K 显示 print 函数文档
   ```

4. **重命名变量：** `<leader>rn`（Space + rn）
   ```python
   old_name = 10  # <- 光标在这里按 <leader>rn
   # 输入新名字，所有引用都会更新
   ```

5. **代码修复：** `<leader>ca`（Space + ca）显示可用的修复建议
   ```python
   # 例如自动导入缺失的模块
   # 自动修复类型错误
   ```

6. **格式化代码：** `<leader>f`（Space + f）
   ```python
   # 格式化前
   def foo(x,y,z):return x+y+z

   # 格式化后
   def foo(x, y, z):
       return x + y + z
   ```

**错误诊断：**
- `]d` - 跳到下一个错误
- `[d` - 跳到上一个错误
- `<leader>d` - 显示错误详情

---

#### 3. Mason - LSP 服务器管理器

**作用：** 自动安装和管理 LSP 服务器、格式化工具、检查工具

**使用方法：**
```vim
:Mason              " 打开 Mason 界面
:MasonInstall pyright   " 安装 Python LSP
:MasonUpdate        " 更新所有工具
```

**在 Mason 界面：**
- 按 `/` 搜索工具
- 光标移到工具上按 `i` 安装
- 按 `u` 更新
- 按 `X` 卸载

---

#### 4. nvim-cmp - 智能补全引擎

**作用：** 提供强大的代码补全功能，整合多个补全源

**补全源：**
- LSP 补全（函数、变量、模块）
- 文件路径补全
- 当前缓冲区单词补全
- 代码片段补全

**使用方法：**

输入代码时自动触发补全：
```python
import num|  # <- 输入 num，补全菜单自动出现
             # 显示：numpy, numbers 等建议
```

**操作快捷键：**
- `<Tab>` - 选择下一项
- `<Shift-Tab>` - 选择上一项
- `<Enter>` - 确认选择
- `<C-Space>` - 手动触发补全
- `<C-j>` / `<C-k>` - 上下导航

**补全图标含义：**
- `λ` - 函数
- `⚿` - 变量
- `▢` - 类
- `⚙` - 模块
- `📄` - 文件

---

#### 5. Telescope - 模糊搜索器

**作用：** 快速查找文件、搜索内容、浏览历史等

**核心功能：**

1. **查找文件** `<leader>ff`（Space + ff）
   ```
   示例：输入 "main.py" 找到 src/main.py
   支持模糊匹配：输入 "mp" 也能找到 main.py
   ```

2. **搜索文件内容** `<leader>fs`（Space + fs）
   ```
   示例：搜索 "def calculate"
   在整个项目中查找包含这段文字的所有文件
   ```

3. **查找当前单词** `<leader>fc`（Space + fc）
   ```
   光标放在变量上，按 <leader>fc
   自动搜索整个项目中该变量的所有出现位置
   ```

4. **最近文件** `<leader>fr`（Space + fr）
   ```
   快速打开最近编辑的文件
   ```

5. **缓冲区列表** `<leader>fb`（Space + fb）
   ```
   查看所有已打开的文件
   ```

**Telescope 界面操作：**
- 输入文字进行搜索
- `<C-j>` / `<C-k>` - 上下移动
- `<Enter>` - 打开文件
- `<C-x>` - 水平分割打开
- `<C-v>` - 垂直分割打开
- `<Esc>` - 关闭 Telescope

**实际工作流：**
```
1. 打开项目后按 <leader>ff 快速找到要编辑的文件
2. 需要查找某个函数在哪里定义？按 <leader>fs 搜索函数名
3. 想看某个变量在哪里被使用？光标放上去按 <leader>fc
```

---

#### 6. Treesitter - 语法高亮和理解

**作用：** 提供精准的语法高亮、代码折叠、智能选择

**功能：**

1. **精准语法高亮**
   ```python
   # Treesitter 能区分不同的代码元素
   def function_name():  # 函数名是一种颜色
       variable = 10     # 变量是另一种颜色
       "string"          # 字符串又是另一种颜色
   ```

2. **增量选择** `<C-Space>`（Ctrl + Space）
   ```python
   # 光标在这里按 Ctrl+Space 逐步扩大选择范围：
   result = calculate(10, 20)
   # 第1次：选中 10
   # 第2次：选中 (10, 20)
   # 第3次：选中 calculate(10, 20)
   # 第4次：选中整行
   ```

**使用命令：**
```vim
:TSUpdate           " 更新语法解析器
:TSInstall python   " 安装 Python 解析器
```

---

#### 7. Codeium - AI 智能补全

**作用：** 免费的 AI 代码助手，类似 GitHub Copilot

**功能：**
- 根据上下文智能生成代码
- 自动完成整行或整个函数
- 多语言支持

**首次使用：**
```vim
:Codeium Auth       " 打开浏览器进行认证
                    " 登录后自动激活
```

**使用方法：**

输入代码时，AI 会自动建议（灰色文字显示）：
```python
def calculate_sum(numbers):
    # 输入这行注释后，AI 可能自动建议：
    total = 0
    for num in numbers:
        total += num
    return total
```

**操作快捷键：**
- `<C-g>` - 接受 AI 建议
- `<C-]>` - 查看下一个建议
- `<C-[>` - 查看上一个建议
- `<C-x>` - 清除建议

**实际应用场景：**
```python
# 1. 写注释，AI 生成代码
# Create a function to read CSV file and return dataframe
# 按 <C-g> AI 会生成完整的函数

# 2. 开始写函数，AI 补全
def send_email(to, subject, body):
    # AI 会建议完整的邮件发送代码
```

---

#### 8. nvim-tree - 文件浏览器

**作用：** 侧边栏文件管理器，类似 VS Code 的资源管理器

**打开/关闭：** `<leader>e`（Space + e）

**常用操作：**
```
在文件树中：
  <Enter>    - 打开文件/展开文件夹
  o          - 在新窗口打开文件
  s          - 垂直分割打开
  i          - 水平分割打开

  a          - 新建文件（文件夹用 / 结尾）
  d          - 删除文件
  r          - 重命名文件
  x          - 剪切文件
  c          - 复制文件
  p          - 粘贴文件

  R          - 刷新文件树
  H          - 显示/隐藏隐藏文件
  -          - 返回上级目录

  ?          - 显示帮助
```

**图标说明：**
- `📁` - 文件夹
- `📄` - 文件
- `✓` - Git 已提交
- `✗` - Git 未提交
- `+` - Git 新增文件
- `~` - Git 修改文件

**实际工作流：**
```
1. 按 <leader>e 打开文件树
2. 用 j/k 上下移动
3. 按 Enter 打开文件
4. 按 a 创建新文件
5. 再次按 <leader>e 关闭文件树
```

---

#### 9. Gitsigns - Git 集成

**作用：** 在编辑器中显示 Git 状态和变更

**功能：**

1. **行号旁显示 Git 状态**
   ```
   + 绿色加号 - 新增的行
   ~ 蓝色波浪 - 修改的行
   - 红色减号 - 删除的行
   ```

2. **查看变更**
   - 光标放在修改的行，自动显示原始内容

3. **导航变更**
   ```vim
   ]c  - 下一个变更
   [c  - 上一个变更
   ```

---

#### 10. Comment.nvim - 代码注释

**作用：** 快速注释/取消注释代码

**使用方法：**

**单行注释：** `gcc`
```python
print("hello")  # <- 光标在这里按 gcc
# print("hello")  # <- 自动添加注释符号
```

**多行注释：** 选中后按 `gc`
```python
# 1. 进入可视模式（按 V）
# 2. 选择多行（按 j 或 k）
# 3. 按 gc
def foo():
    pass
# 变成：
# def foo():
#     pass
```

**块注释：** `gbc`
```python
# 适用于支持块注释的语言
"""
This becomes a block comment
"""
```

---

#### 11. Which-Key - 快捷键提示

**作用：** 按下 `<leader>`（Space）后，自动显示可用的快捷键

**使用方法：**
```
1. 按 Space
2. 等待 1 秒
3. 自动显示所有可用的快捷键和说明
```

**示例：**
```
按 Space 后显示：
  e  → File Explorer
  f  → Find (Telescope)
  w  → Write (Save)
  q  → Quit
  ...
```

---

#### 12. Bufferline - 缓冲区标签栏

**作用：** 在顶部显示打开的文件标签，类似浏览器标签

**操作：**
- `Shift + H` - 切换到上一个标签
- `Shift + L` - 切换到下一个标签
- `<leader>bd` - 关闭当前标签

**显示信息：**
- 文件名
- 文件类型图标
- 修改状态（未保存显示 ●）

---

#### 13. Lualine - 状态栏

**作用：** 底部状态栏，显示重要信息

**显示内容：**
```
[模式] 文件名 [Git分支] [文件类型] 行号/总行数 编码
```

**模式颜色：**
- 绿色 - Normal 模式
- 蓝色 - Insert 模式
- 紫色 - Visual 模式
- 红色 - Command 模式

---

#### 14. Auto Pairs - 自动配对

**作用：** 自动补全括号、引号等配对符号

**示例：**
```python
# 输入 (
(|)  # 自动补全右括号，光标在中间

# 输入 "
"|"  # 自动补全引号

# 输入 [
[|]  # 自动补全方括号
```

**智能删除：**
```
(|)  # 按 Backspace 同时删除两个括号
```

---

#### 15. Indent Blankline - 缩进指示线

**作用：** 显示缩进级别的垂直线

**效果：**
```python
def function():
│   if condition:
│   │   print("hello")
│   │   for i in range(10):
│   │   │   process(i)
```

帮助你快速识别代码块的层级关系。

---

## 快速工作流示例

### Python 开发工作流

**1. 打开项目**
```bash
nvim .
# 或
cd project && nvim
```

**2. 查找文件**
```
按 Space + ff
输入文件名
按 Enter 打开
```

**3. 编写代码**
```python
# 输入代码，享受：
# - 自动补全（nvim-cmp）
# - AI 建议（Codeium，按 Ctrl+g 接受）
# - 自动配对括号
def calculate(x, y):
    return x + y
```

**4. 查看错误**
```
如果有红色波浪线（错误）：
  按 ]d 跳到错误
  按 <leader>d 查看详情
  按 <leader>ca 查看修复建议
```

**5. 跳转定义**
```python
result = calculate(10, 20)
# 光标放在 calculate 上
# 按 gd 跳到函数定义
# 按 Ctrl+o 返回
```

**6. 搜索引用**
```
光标放在函数名上
按 gr 查看所有使用这个函数的地方
```

**7. 重构重命名**
```python
old_name = 10
# 光标放在 old_name 上
# 按 Space + rn
# 输入 new_name
# 所有引用自动更新
```

**8. 格式化代码**
```
按 Space + f
代码自动格式化
```

**9. 保存退出**
```
按 Space + w 保存
按 Space + q 退出
```

---

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
cd /path/to/vimrc
git pull
```

Then in Neovim: `:Lazy sync`

### If Copied Configuration

```bash
cd /path/to/vimrc
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

## 实用技巧和最佳实践

### 日常开发技巧

#### 1. 多文件编辑

**场景：** 同时编辑多个文件

```
方法 1：使用 Telescope 查找文件
  Space + ff → 找到文件 → Enter 打开
  Space + ff → 找到另一个文件 → Enter 打开
  Shift + H/L 在文件间切换

方法 2：使用文件树
  Space + e → 打开文件树
  选择文件 → s (垂直分割) 或 i (水平分割)
  Ctrl + h/j/k/l 在分割窗口间移动
```

#### 2. 快速跳转

**光标历史跳转：**
```
Ctrl + o  - 跳回上一个位置（非常有用！）
Ctrl + i  - 跳到下一个位置
```

**示例工作流：**
```
1. 在 main.py 按 gd 跳到函数定义（在 utils.py）
2. 看完定义后按 Ctrl+o 返回 main.py 原位置
```

**行内快速移动：**
```
f + 字符  - 跳到该字符（向前）
F + 字符  - 跳到该字符（向后）
;         - 重复上次 f/F 跳转
,         - 反向重复上次 f/F 跳转

示例：
result = calculate(10, 20)
       ^ 光标在这里
按 f( 跳到左括号
按 ; 跳到右括号
```

#### 3. 批量操作

**多行编辑（Visual Block 模式）：**
```
1. Ctrl + v 进入 Visual Block 模式
2. j/k 选择多行
3. Shift + I 在行首插入
4. 输入内容
5. 按 Esc 应用到所有行
```

**示例 - 批量添加注释：**
```python
print("line 1")
print("line 2")
print("line 3")

# 操作：Ctrl+v 选择多行 → Shift+I → 输入 # → Esc
# 结果：
# print("line 1")
# print("line 2")
# print("line 3")
```

**查找并替换：**
```vim
:%s/old/new/g       " 全文件替换
:%s/old/new/gc      " 替换时逐个确认
:5,10s/old/new/g    " 只在 5-10 行替换
```

#### 4. 代码片段和模板

**使用 LSP 代码片段：**
```python
# 输入 def → 按 Tab
def function_name(args):
    pass  # 自动生成函数模板

# 输入 for → 按 Tab
for item in items:
    pass  # 自动生成 for 循环
```

#### 5. 终端集成

**在 Neovim 中打开终端：**
```vim
:terminal           " 打开终端
:split | terminal   " 水平分割打开终端
:vsplit | terminal  " 垂直分割打开终端
```

**终端模式快捷键：**
```
Ctrl + \, Ctrl + n  - 退出终端模式（回到 Normal 模式）
i 或 a              - 进入终端模式（可以输入命令）
```

**实际用途：**
```
1. Space + sh 水平分割
2. :terminal
3. 运行 pytest, python script.py 等
4. Ctrl+\, Ctrl+n 退出终端
5. Ctrl+j 切回编辑器
```

### 常见使用场景

#### 场景 1：调试 Python 代码

```python
# 1. 编写代码时发现错误（红色波浪线）
def calculate(x, y)
    return x + y  # <- LSP 提示语法错误

# 2. 按 ]d 跳到错误
# 3. 按 <leader>d 查看详情："SyntaxError: invalid syntax"
# 4. 按 <leader>ca 查看修复建议
# 5. 选择修复方案或手动修复（添加冒号）

def calculate(x, y):
    return x + y  # <- 修复后错误消失
```

#### 场景 2：重构代码

**重命名变量：**
```python
# 旧代码
data = load_data()
process_data(data)
save_data(data)

# 重构：光标放在第一个 data 上
# 按 Space + rn
# 输入 user_data
# 所有 data 自动重命名为 user_data

user_data = load_data()
process_data(user_data)
save_data(user_data)
```

**提取函数：**
```python
# 选中要提取的代码（Visual 模式）
# 使用 LSP 的 Code Actions (Space + ca)
# 选择 "Extract to function"
```

#### 场景 3：查找和理解代码

**探索新项目：**
```
1. Space + ff 浏览文件结构
2. 找到 main.py 打开
3. 看到 calculate() 函数，按 gd 跳到定义
4. 按 gr 查看所有调用这个函数的地方
5. Space + fs 搜索 "TODO" 找所有待办事项
```

**理解函数用法：**
```python
# 光标放在函数名上
requests.get()  # <- 光标在这里

# 按 K 显示函数文档：
# get(url, params=None, **kwargs)
#     Sends a GET request.
#     :param url: URL for the request
#     ...
```

#### 场景 4：使用 AI 辅助编码

**让 AI 帮你写函数：**
```python
# 1. 写注释描述需求
# Read a CSV file and return a pandas DataFrame with error handling

# 2. AI (Codeium) 会自动建议代码（灰色显示）
def read_csv_with_error_handling(filepath):
    try:
        import pandas as pd
        return pd.read_csv(filepath)
    except FileNotFoundError:
        print(f"File {filepath} not found")
        return None
    except Exception as e:
        print(f"Error reading file: {e}")
        return None

# 3. 按 Ctrl+g 接受建议
```

**AI 补全样板代码：**
```python
# 输入类名和第一个方法
class DataProcessor:
    def __init__(self, data):
        # AI 可能自动建议：
        self.data = data
        self.processed = False

    def process(self):
        # AI 继续建议处理逻辑
```

### 快捷键速查表

**必记快捷键 Top 10：**

```
1. Space + e      - 文件树开关（最常用）
2. Space + ff     - 查找文件（最常用）
3. Space + fs     - 搜索内容（最常用）
4. gd             - 跳转定义（编程必备）
5. Ctrl + o       - 返回上一位置（配合 gd 使用）
6. Space + rn     - 重命名（重构利器）
7. K              - 查看文档（理解代码）
8. gcc            - 注释/取消注释（快速调试）
9. Space + w      - 保存文件
10. Ctrl + g      - 接受 AI 建议（提升效率）
```

**Vim 基础操作（如果你是 Vim 新手）：**

```
移动：
  h/j/k/l   - 左/下/上/右
  w         - 下一个单词
  b         - 上一个单词
  0         - 行首
  $         - 行尾
  gg        - 文件开头
  G         - 文件结尾

编辑：
  i         - 在光标前插入
  a         - 在光标后插入
  o         - 在下方新建行并插入
  O         - 在上方新建行并插入
  dd        - 删除当前行
  yy        - 复制当前行
  p         - 粘贴
  u         - 撤销
  Ctrl + r  - 重做

模式切换：
  Esc       - 返回 Normal 模式
  i/a/o     - 进入 Insert 模式
  v         - 进入 Visual 模式
  V         - 进入 Visual Line 模式
  Ctrl + v  - 进入 Visual Block 模式
```

### 性能优化建议

**如果启动较慢：**
```vim
:Lazy profile       " 查看插件加载时间
" 禁用不需要的插件（编辑 lua/plugins/init.lua）
```

**如果 LSP 较慢：**
```vim
:LspInfo            " 查看 LSP 状态
:LspRestart         " 重启 LSP 服务器
```

**减少内存占用：**
```vim
" 关闭不用的缓冲区
:bufdo bd           " 关闭所有缓冲区
Space + bd          " 关闭当前缓冲区
```

### 学习资源

**Vim 基础：**
- 在终端运行 `vimtutor` 学习 Vim 基础（30 分钟）
- 网站：https://vim-adventures.com/（游戏化学习）

**Neovim 进阶：**
- 官方文档：`:help` 或 `:help <关键词>`
- Neovim 官网：https://neovim.io/doc/

**插件文档：**
```vim
:help telescope         " Telescope 帮助
:help lsp               " LSP 帮助
:help nvim-cmp          " 补全帮助
```

### 故障排除补充

**问题：AI 补全不显示**
```vim
:Codeium Status         " 检查状态
:Codeium Auth           " 重新认证
:Codeium Disable        " 禁用
:Codeium Enable         " 启用
```

**问题：某个文件类型没有高亮**
```vim
:TSInstall <language>   " 手动安装语法解析器
:TSUpdate               " 更新所有解析器
```

**问题：快捷键不生效**
```vim
:map <leader>ff         " 检查快捷键绑定
:verbose map <leader>ff " 查看快捷键定义位置
```

**问题：LSP 报错找不到模块**
```python
# Python 项目需要虚拟环境
python -m venv venv
source venv/bin/activate  # Linux/Mac
# 或
venv\Scripts\activate     # Windows

# 然后在虚拟环境中打开 nvim
nvim .
```

### 从其他编辑器迁移

**从 VS Code 迁移：**
```
VS Code              →  Neovim 等价操作
Ctrl + P             →  Space + ff (查找文件)
Ctrl + Shift + F     →  Space + fs (全局搜索)
F12                  →  gd (跳转定义)
Shift + F12          →  gr (查找引用)
F2                   →  Space + rn (重命名)
Ctrl + Space         →  自动触发（输入时）
Ctrl + /             →  gcc (注释)
Ctrl + B             →  Space + e (文件树)
```

**从 PyCharm 迁移：**
```
PyCharm              →  Neovim 等价操作
Ctrl + N             →  Space + ff
Shift + Shift        →  Space + ff
Ctrl + Click         →  gd
Alt + F7             →  gr
Shift + F6           →  Space + rn
Ctrl + Alt + L       →  Space + f (格式化)
Ctrl + Q             →  K (查看文档)
```

---

**提示：** 所有这些功能都已配置好，开箱即用！如果遇到问题，查看上面的故障排除部分，或运行 `:checkhealth` 检查配置。

## Contributing

Feel free to customize this configuration to your needs! If you make improvements, consider sharing them.

## Repository Setup Guide

### Recommended Repository Names

When creating your own copy of this configuration, consider these naming options:

- **`nvim-config`** ⭐ Recommended - Simple and clear
- **`neovim-config`** - More explicit
- **`modern-nvim`** - Emphasizes modern features
- **`nvim-ide`** - Highlights IDE-like functionality
- **`dotfiles-nvim`** - If part of larger dotfiles collection
- **`nvim-python-ide`** - Emphasizes Python development

### Creating Your Repository

1. **Fork or create a new repository** on GitHub:
   - Visit: https://github.com/new
   - Choose your preferred name (e.g., `nvim-config`)
   - Description: `Modern Neovim configuration with Python LSP, AI autocomplete, and fuzzy search`
   - Make it Public or Private

2. **Clone and customize:**
   ```bash
   git clone https://github.com/ykkaixin/vimrc.git
   cd vimrc
   # Customize your configuration as needed
   ```

3. **Keep it updated:**
   ```bash
   # After making changes
   git add .
   git commit -m "Update configuration"
   git push
   ```

### Sharing Your Configuration

Your repository URL will be:
```bash
https://github.com/ykkaixin/vimrc
```

Anyone can then use your configuration:
```bash
git clone https://github.com/ykkaixin/vimrc.git
cd vimrc
./install.sh
```

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
