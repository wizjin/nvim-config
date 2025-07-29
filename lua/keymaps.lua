-- NeoVim Keymap
vim.g.mapleader = ' '

-- Telescop
local telescope = require('telescope.builtin')

-- Keymaps
local wk = require("which-key")
-- Global
wk.add({
	{ "<f9>", "<cmd>:tabprevious<cr>", desc = "Goto prev tab" },
	{ "<f10>", "<cmd>:tabnext<cr>", desc = "Goto next tab" }
})
-- Leader
wk.add({
	{ "<leader>f", group = "File" },
	{ "<leader>ff", telescope.find_files, desc = "Find file" },
	{ "<leader>fr", telescope.oldfiles, desc = "Open recent file" },
	{ "<leader>fb", telescope.buffers, desc = "Find buffer" },
	{ "<leader>fg", telescope.live_grep, desc = "Live grep" },
	{ "<leader>fw", "<cmd>:write<cr>", desc = "Save" },
	{ "<leader>fn", "<cmd>:tabnew<cr>", desc = "New" },
	{ "<leader>p", group = "Project" },
	{ "<leader>pp",	"<cmd>:NvimTreeFocus<cr>", desc = "Go to tree" },
	{ "<leader>pt", "<cmd>:NvimTreeToggle<cr>", desc = "Toggle" },
	{ "<leader>pf", "<cmd>:NvimTreeFindFile<cr>", desc = "Find file" },
	{ "<leader>w", group = "Window" },
	{ "<leader>ws", "<cmd>:vsplit<cr>", desc = "Split vertical" },
	{ "<leader>wS", "<cmd>:split<cr>", desc = "Split horizontal" },
	{ "<leader>wn", "<cmd>:vnew<cr>", desc = "New vertical" },
	{ "<leader>wN", "<cmd>:new<cr>", desc = "New horizontal" },
	{ "<leader>wc", "<cmd>:quit<cr>", desc = "Close" },
	{ "<leader>wk", "<cmd>:wincmd k<cr>", desc = "Go to up" },
	{ "<leader>wj", "<cmd>:wincmd j<cr>", desc = "Go to down" },
	{ "<leader>wh", "<cmd>:wincmd h<cr>", desc = "Go to left" },
	{ "<leader>wl", "<cmd>:wincmd l<cr>", desc = "Go to right" },
	{ "<leader>ww", "<cmd>:wincmd w<cr>", desc = "Go to next" },
	{ "<leader>wW", "<cmd>:wincmd W<cr>", desc = "Go to previous" },
	{ "<leader>u", group = "Utils" },
	{ "<leader>uj", "<cmd>:%!jq .<cr>", desc = "Json formatter" },
	{ "<leader>h", desc = "Help" },
	{ "<leader>hh", "<cmd>:help<cr>", desc = "NeoVim" },
	{ "<leader>hk", "<cmd>:WhichKey<cr>", desc = "Keymaps" }
})
