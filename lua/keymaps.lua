-- NeoVim Keymap
vim.g.mapleader = ' '

-- Telescop
local telescope = require('telescope.builtin')

-- Keymaps
local wk = require("which-key")
-- Global
wk.register({
	['<f9>'] = { '<cmd>:tabprevious<cr>', 'Goto prev tab' },
	['<f10>'] = { '<cmd>:tabnext<cr>', 'Goto next tab' }
})
-- Leader
wk.register({
	f = {
		name = 'File',
		f = { telescope.find_files, 'Find file' },
		r = { telescope.oldfiles, 'Open recent file' },
		b = { telescope.buffers, 'Find buffer' },
		g = { telescope.live_grep, 'Live grep' },
		w = { '<cmd>:write<cr>', 'Save' },
		n = { '<cmd>:tabnew<cr>', 'New' }
	},
	p = {
		name = 'Project',
		p = { '<cmd>:NvimTreeFocus<cr>', 'Go to tree' },
		t = { '<cmd>:NvimTreeToggle<cr>', 'Toggle' },
		f = { '<cmd>:NvimTreeFindFile<cr>', 'Find file' }
	},
	w = {
		name = 'Window',
		s = { '<cmd>:vsplit<cr>', 'Split vertical' },
		S = { '<cmd>:split<cr>', 'Split horizontal' },
		n = { '<cmd>:vnew<cr>', 'New vertical' },
		N = { '<cmd>:new<cr>', 'New horizontal' },
		c = { '<cmd>:quit<cr>', 'Close' },
		k = { '<cmd>:wincmd k<cr>', 'Go to up' },
		j = { '<cmd>:wincmd j<cr>', 'Go to down' },
		h = { '<cmd>:wincmd h<cr>', 'Go to left' },
		l = { '<cmd>:wincmd l<cr>', 'Go to right' },
		w = { '<cmd>:wincmd w<cr>', 'Go to next' },
		W = { '<cmd>:wincmd W<cr>', 'Go to previous' }
	},
	u = {
		name = 'Utils',
		j = { '<cmd>:%!jq .<cr>', 'Json formatter' }
	},
	h = {
		name = 'Help',
		h = { '<cmd>:help<cr>', 'NeoVim' },
		k = { '<cmd>:WhichKey<cr>', 'Keymaps' }
	}
}, {
	prefix='<leader>'
})

