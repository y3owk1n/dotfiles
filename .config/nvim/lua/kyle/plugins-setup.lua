local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Have packer use a popup window
packer.init({
	auto_reload_compiled = true,
	profile = {
		enable = true,
		threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	},
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
})

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use({ "wbthomason/packer.nvim" }) -- packer as package manager

	use({ "nvim-lua/plenary.nvim", mode = "plenary" }) -- lua functions that many plugins use

	use({ "lewis6991/impatient.nvim" }) -- optimisation

	-- use({ "dstein64/vim-startuptime" })

	use({ "catppuccin/nvim", as = "catppuccin" }) -- catppuccin colorscheme

	use({ "kyazdani42/nvim-web-devicons", after = "catppuccin" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("kyle.plugins.lualine")
		end,
		after = "catppuccin",
	})

	use({
		"nvim-tree/nvim-tree.lua",
		opt = true,
		config = function()
			require("kyle.plugins.nvim-tree")
		end,
		cmd = {
			"NvimTreeClipboard",
			"NvimTreeClose",
			"NvimTreeFindFile",
			"NvimTreeOpen",
			"NvimTreeRefresh",
			"NvimTreeToggle",
		},
		event = "VimEnter",
	})

	use({
		"neovim/nvim-lspconfig",

		config = function()
			require("kyle.plugins.lsp")
		end,
		requires = {
			-- { 'b0o/SchemaStore.nvim' },
			-- { 'williamboman/nvim-lsp-installer' },
			-- { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("kyle.plugins.lsp.null-ls")
				end,
				after = "nvim-lspconfig",
			},
			{
				"williamboman/mason.nvim",
				config = function()
					require("kyle.plugins.lsp.mason")
				end,
				after = "nvim-lspconfig",
			},
			{ "jayp0521/mason-null-ls.nvim", after = { "null-ls.nvim", "nvim-lspconfig", "mason.nvim" } },
			{ "williamboman/mason-lspconfig.nvim" },
			-- {
			--   'ray-x/lsp_signature.nvim',
			--   config = function()
			--     require('cosmic.plugins.lsp-signature')
			--   end,
			--   after = 'nvim-lspconfig',
			-- },
		},
		event = "BufWinEnter",
	})

	-- autocompletion
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("kyle.plugins.nvim-cmp")
		end,
		wants = { "LuaSnip" },
		requires = {
			{
				"L3MON4D3/LuaSnip",
				wants = "friendly-snippets",
				requires = {
					"rafamadriz/friendly-snippets",
				},
			},
			{
				"hrsh7th/cmp-nvim-lsp",
				config = function()
					require("kyle.plugins.lsp.handlers")
				end,
				after = "nvim-cmp",
			},
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{
				"windwp/nvim-autopairs",
				config = function()
					require("kyle.plugins.autopairs")
				end,
				after = "nvim-cmp",
			},
		},
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		opt = true,
		event = "BufWinEnter",
		config = function()
			require("kyle.plugins.gitsigns")
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		opt = true,
		event = "BufWinEnter",
		config = function()
			require("kyle.plugins.toggleterm")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			-- 'nvim-lua/popup.nvim',
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
		},
		config = function()
			require("kyle.plugins.telescope")
		end,
		event = "BufWinEnter",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		requires = {
			{ "windwp/nvim-ts-autotag" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "nvim-treesitter/nvim-treesitter-context" },
			-- 'nvim-treesitter/nvim-treesitter-refactor',
		},
		run = ":TSUpdate",
		config = function()
			require("kyle.plugins.treesitter")
		end,
		event = "BufRead",
	})

	use({
		"numToStr/Comment.nvim",
		opt = true,
		requires = {
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
		config = function()
			require("kyle.plugins.comment")
		end,
		event = "BufWinEnter",
	})

	use({
		"norcalli/nvim-colorizer.lua",
		opt = true,
		config = function()
			require("kyle.plugins.colorizer")
		end,
		event = "BufWinEnter",
	})

	use({
		"folke/which-key.nvim",
		opt = true,
		config = function()
			require("kyle.plugins.which-key")
		end,
		-- keys = "<space>",
		event = "VimEnter",
	})

	use({
		"kylechui/nvim-surround",
		opt = true,
		require = "nvim-treesitter/nvim-treesitter",
		-- opt for sandwitch for now until some issue been addressed
		-- event = { "CursorMoved", "CursorMovedI" },
		config = function()
			require("nvim-surround").setup({})
		end,
		event = "BufWinEnter",
	})

	use({
		"karb94/neoscroll.nvim",
		opt = true,
		config = function()
			require("kyle.plugins.neoscroll")
		end,
		event = "BufWinEnter",
	})

	use({
		"akinsho/nvim-bufferline.lua",
		event = "UIEnter",
		config = function()
			require("kyle.plugins.bufferline")
		end,
		opt = true,
	})

	use({ "lukas-reineke/indent-blankline.nvim", event = "BufReadPre", after = "nvim-treesitter", opt = true })

	use({ "ThePrimeagen/harpoon", event = "BufWinEnter", opt = true }) -- project markings

	if packer_bootstrap then
		require("packer").sync()
	end
end)
