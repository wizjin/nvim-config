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
	use {
		'echasnovski/mini.nvim',
		version = '*'
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
			require('ibl').setup {
				indent = { char = '│' }
			}
		end
	}
	use {
  		'lewis6991/gitsigns.nvim', tag = 'v0.7',
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
					'markdown_inline', 'javascript', 'json', 'proto', 'python',
					'rust', 'sql', 'typescript', 'vue', 'yaml'
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				}
			}
		end
	}
	use {
		'neovim/nvim-lspconfig',
		config = function()
			vim.lsp.config('clangd', {})
			vim.lsp.config('lua_ls', {})
			vim.lsp.config('pyright', {})
			vim.lsp.config('ts_ls', {})
			vim.lsp.enable({ 'clangd', 'lua_ls', 'pyright', 'ts_ls' })
		end
	}
	use {
		'mrcjkb/rustaceanvim',
		version = '^5',
		lazy = false,
		config = function()
			vim.g.rustaceanvim = {
				tools = {
					runnables = { use_telescope = true },
				},
				server = {
					settings = {
						['rust-analyzer'] = {
							checkOnSave = { command = 'clippy' }
						}
					}
				}
			}
		end
	}
	-- Autocompletion framework
	use {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		after = { 'hrsh7th/nvim-cmp' },
		requires = { 'hrsh7th/nvim-cmp' }
	}
	use 'hrsh7th/vim-vsnip'
	use {
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require('cmp')
			cmp.setup {
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						vim.fn['vsnip#anonymous'](args.body)
					end
				},
				mapping = {
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.close(),
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Insert,
						select = true
					}
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'vsnip' },
					{ name = 'path' },
					{ name = 'buffer' }
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

