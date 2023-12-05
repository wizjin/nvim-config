-- NeoVim Options
-- General
vim.o.showmode = false
vim.o.guifont = 'MesloLGS NF:h13'
-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.lazyredraw = false
vim.o.magic = true
vim.o.showmatch = true
-- Files, backup and undo
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.number = true
vim.o.wrap = true
vim.o.smartindent = true
vim.o.fileformats = 'unix,dos,mac'
-- Text, tab and indent related
vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- Tabs
vim.o.showtabline = 2
-- Complete
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.opt.shortmess = vim.opt.shortmess + 'c'
-- Neovide
if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0
end
