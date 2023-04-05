-- NeoVim Plugins
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Plugins
	use {
		'folke/tokyonight.nvim',
		config = function()
			require('tokyonight').setup({style = 'night'})
			vim.cmd[[colorscheme tokyonight]]
		end
	}
	use {
		'nvim-tree/nvim-tree.lua',
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.o.termguicolors = true
			require('nvim-tree').setup()
		end
	}
	use 'nvim-tree/nvim-web-devicons'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				options = {
					theme = 'tokyonight'
				}
			}
		end
	}
	use {
		'folke/which-key.nvim',
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require('which-key').setup()
		end
	}
	use 'nvim-lua/plenary.nvim'
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		config = function()
			require('telescope').setup()	
		end
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('indent_blankline').setup {
				show_current_context = true,
				show_current_context_start = true
			}
		end
	}
	use {
  		'lewis6991/gitsigns.nvim', tag = 'release',
		config = function()
    		require('gitsigns').setup()
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = {
					'c', 'lua', 'vim', 'vimdoc',
					'bash', 'cpp', 'css', 'diff', 'dockerfile', 'html', 'make',
					'markdown_inline', 'json', 'proto', 'python', 'sql', 'yaml'
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				}
			}
		end
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

