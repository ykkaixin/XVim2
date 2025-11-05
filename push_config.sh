#!/bin/bash

# 推送 Neovim 配置到 GitHub 仓库
# 支持重命名为更合适的仓库名称

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  推送现代 Neovim 配置到 GitHub"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 检查是否在正确的目录
if [ ! -f "init.lua" ]; then
    echo "❌ 错误：请在包含 Neovim 配置的目录下运行此脚本"
    echo ""
    echo "正确的步骤："
    echo "  cd ~/XVim2"
    echo "  git checkout claude/convert-to-neovim-config-011CUpE8FRmAhTtpmh5TFZv3"
    echo "  ./push_config.sh"
    exit 1
fi

echo "✓ 检测到 Neovim 配置文件"
echo ""

# 推荐的仓库名称
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "选择仓库名称"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "推荐的仓库名称："
echo "  1. nvim-config       ⭐ 推荐 - 简洁专业"
echo "  2. modern-nvim       - 强调现代特性"
echo "  3. nvim-ide          - 强调IDE功能"
echo "  4. neovim-setup      - 完整配置"
echo "  5. nvim-python-ide   - 突出Python开发"
echo "  6. vimrc             - 保持原名（经典）"
echo "  7. 自定义名称"
echo ""
echo "请选择 (1-7) 或直接输入仓库名称："
read -r choice

case $choice in
    1)
        REPO_NAME="nvim-config"
        ;;
    2)
        REPO_NAME="modern-nvim"
        ;;
    3)
        REPO_NAME="nvim-ide"
        ;;
    4)
        REPO_NAME="neovim-setup"
        ;;
    5)
        REPO_NAME="nvim-python-ide"
        ;;
    6)
        REPO_NAME="vimrc"
        ;;
    7)
        echo ""
        echo "请输入自定义仓库名称："
        read -r REPO_NAME
        ;;
    *)
        # 如果直接输入了名称，使用输入的值
        REPO_NAME="$choice"
        ;;
esac

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "配置信息"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  仓库名称: $REPO_NAME"
echo "  GitHub URL: https://github.com/ykkaixin/$REPO_NAME"
echo "  用户名: ykkaixin"
echo ""

# 如果仓库名不是 vimrc，提示重命名
if [ "$REPO_NAME" != "vimrc" ]; then
    echo "⚠️  注意事项："
    echo ""
    echo "  你的当前仓库是: https://github.com/ykkaixin/vimrc"
    echo "  目标仓库名称是: $REPO_NAME"
    echo ""
    echo "  请选择操作方式："
    echo ""
    echo "  选项 A: 在 GitHub 上重命名现有的 vimrc 仓库"
    echo "    1. 访问 https://github.com/ykkaixin/vimrc/settings"
    echo "    2. 找到 'Repository name' 部分"
    echo "    3. 将 'vimrc' 改为 '$REPO_NAME'"
    echo "    4. 点击 'Rename'"
    echo "    5. 然后回到这里继续"
    echo ""
    echo "  选项 B: 创建新仓库 $REPO_NAME"
    echo "    1. 访问 https://github.com/new"
    echo "    2. Repository name: $REPO_NAME"
    echo "    3. 不要勾选任何初始化选项"
    echo "    4. Create repository"
    echo "    5. 然后回到这里继续"
    echo ""
    echo "完成上述操作后，按回车继续推送..."
    read -r
fi

# 创建临时目录
TEMP_DIR=$(mktemp -d)
echo "✓ 创建临时目录: $TEMP_DIR"

# 复制配置文件
echo "✓ 复制配置文件..."
cp init.lua "$TEMP_DIR/"
cp install.sh "$TEMP_DIR/"
cp README.md "$TEMP_DIR/"
cp LICENSE "$TEMP_DIR/"
cp .gitignore "$TEMP_DIR/"
cp -r lua "$TEMP_DIR/"

# 进入临时目录
cd "$TEMP_DIR"

# 更新README中的仓库引用
echo "✓ 更新README中的仓库名称..."
sed -i.bak "s/YOUR_USERNAME/ykkaixin/g" README.md
sed -i.bak "s/nvim-config/$REPO_NAME/g" README.md
rm -f README.md.bak

# 初始化 Git
echo "✓ 初始化 Git 仓库..."
git init
git add .
git commit -m "Initial commit: Modern Neovim configuration

Complete IDE-like setup with:
- 🐍 Python LSP (Pyright) with intelligent autocomplete
- 🤖 AI-powered autocomplete (Codeium - free alternative to Copilot)
- 🔍 Fuzzy finder (Telescope) for blazing-fast file/text search
- ⚡ Smart autocompletion (nvim-cmp) with multiple sources
- 🎨 Advanced syntax highlighting (Treesitter)
- 📁 File explorer (nvim-tree) with git integration
- 🎭 Beautiful UI (TokyoNight theme, lualine, bufferline)

Features:
- Modular Lua configuration structure
- Comprehensive multi-platform installation guide
- Automated installation script
- Support for Python, Lua, TypeScript, HTML, CSS, JSON, Bash
"

# 添加远程仓库
echo "✓ 连接到仓库 https://github.com/ykkaixin/$REPO_NAME"
git remote add origin "https://github.com/ykkaixin/$REPO_NAME.git"

# 重命名分支
git branch -M main

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "准备推送"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "目标仓库: https://github.com/ykkaixin/$REPO_NAME"
echo ""
echo "按回车开始推送，或 Ctrl+C 取消..."
read -r

# 推送（自动处理可能的冲突）
echo "正在推送..."
if git push -u origin main 2>/dev/null; then
    SUCCESS=true
else
    echo ""
    echo "⚠️  常规推送失败，尝试强制推送..."
    if git push -f origin main; then
        SUCCESS=true
    else
        SUCCESS=false
    fi
fi

if [ "$SUCCESS" = true ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  🎉 成功！配置已推送到仓库"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "🌐 仓库地址: https://github.com/ykkaixin/$REPO_NAME"
    echo ""
    echo "在新电脑上使用："
    echo "  git clone https://github.com/ykkaixin/$REPO_NAME.git"
    echo "  cd $REPO_NAME"
    echo "  ./install.sh"
    echo "  nvim"
    echo ""
    echo "首次启动Neovim时，插件会自动安装（2-5分钟）"
    echo "AI补全需要认证: 在Neovim中运行 :Codeium Auth"
    echo ""
else
    echo ""
    echo "❌ 推送失败"
    echo ""
    echo "可能的原因："
    echo "  1. 仓库 https://github.com/ykkaixin/$REPO_NAME 不存在"
    echo "  2. 仓库名称拼写错误"
    echo "  3. 网络连接问题"
    echo "  4. 权限问题"
    echo ""
    echo "请检查后，可以手动推送："
    echo "  cd $TEMP_DIR"
    echo "  git push -f origin main"
    echo ""
    exit 1
fi

# 清理
echo "清理临时文件..."
cd ~
rm -rf "$TEMP_DIR"
echo "✓ 完成"
