# AGENTS.md

## 项目概述

nvim-config 是 Neovim 个人配置文件，使用 Lua 编写，模块化结构。

## 代码规范

- 4 空格缩进
- 简体中文回复
- 直接回答，不客套

## 工作习惯

- 先读文件再改
- 不确定就问
- 最小修改

## 项目结构

```
nvim-config/
├── init.lua
├── lua/
│   ├── options.lua   # 选项
│   ├── plugins.lua   # 插件 (packer)
│   └── keymaps.lua   # 快捷键
└── plugin/packer_compiled.lua
```

## 启动流程

init.lua → options → plugins → keymaps

## 关键配置

### init.lua
- `<leader>` = 空格
- 禁用 perl/python providers

### options.lua
- `opt.number` - 行号
- `opt.tabstop = 4` - Tab 宽度
- `opt.shiftwidth = 4` - 缩进宽度
- `opt.smartcase` - 智能大小写
- `opt.swapfile = false`
- `opt.backup = false`

### plugins.lua
```lua
use { 'owner/repo', config = function() end }
```

### keymaps.lua
```lua
vim.keymap.set('n', '<leader>xx', ':命令<CR>', { desc = '描述' })
```

## 快捷键

| 前缀 | 功能 |
|------|------|
| `<leader>f` | 文件 (Find) |
| `<leader>p` | 项目 (Project) |
| `<leader>w` | 窗口 (Window) |
| `<leader>u` | 工具 (Utility) |

| 快捷键 | 功能 |
|--------|------|
| `<leader>ff` | 查找文件 |
| `<leader>fr` | 最近文件 |
| `<leader>fb` | 缓冲区 |
| `<leader>pp` | 聚焦文件树 |
| `<leader>ws` | 垂直分割 |

## 依赖

- Neovim 0.5+
- Ripgrep
- FD
- JQ

## 语言服务器

- lua-language-server
- pyright
- rust-analyzer
- typescript-language-server
- clangd

## 常用操作

```vim
:PackerInstall  " 安装插件
:PackerUpdate   " 更新插件
:PackerSync     " 同步插件
:PackerClean    " 清理插件
:checkhealth    " 验证配置
:LspInfo        " LSP 状态
:WhichKey       " 查看快捷键
```

## 添加插件

```lua
use { 'owner/repo', config = function() end }
```

## 添加快捷键

```lua
vim.keymap.set('n', '<leader>xx', ':命令<CR>', { desc = '描述' })
```

## 支持语言

C、C++、Lua、Vim、Bash、Python、Rust、TypeScript、JavaScript、JSON、Markdown、HTML、CSS、Go、Rust、SQL、YAML、Vue
