local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("akinsho/toggleterm.nvim") -- Some terminal
	use("lewis6991/impatient.nvim") -- Perf improvement
	use("ur4ltz/surround.nvim") -- Easily surround objects
	use("lukas-reineke/indent-blankline.nvim") -- Display blank ling indentation guides
	use("nvim-tree/nvim-tree.lua") -- Simple file explorer
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- Autoclose tags
	-- Themes
	use("kyazdani42/nvim-web-devicons") -- Icons
	use("arcticicestudio/nord-vim") -- Nord theme
	use("nvim-lualine/lualine.nvim") -- Bottom(status)line plugin where things are displayed

	-- Completion, Snippets
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("hrsh7th/cmp-nvim-lsp") -- Completion for LSP
	use("hrsh7th/cmp-nvim-lua") -- Completion for Lua

	-- LSP
	use("williamboman/mason.nvim") -- Simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- Integration with LSP config
	use("neovim/nvim-lspconfig") -- Enable and configure LSP
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- Enhanced LSP UIs
	use("jose-elias-alvarez/typescript.nvim") -- Additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- VSCode like icons for autocompletion

	-- Formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- Configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- Bridges gap b/w Mason & null-ls

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- Fuzzy finder
	use("nvim-telescope/telescope-fzy-native.nvim") -- Faster(?) engine?

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter", -- Treesitter integration
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow") -- Display colors for things based on Treesitter

	-- Git
	use("lewis6991/gitsigns.nvim") -- Git diff in the gutter
	use("TimUntersberger/neogit") -- Magit clone written for Neovim

	use({
		"nathom/filetype.nvim", -- Filetype bindings
		config = function()
			require("filetype").setup({
				overrides = {
					extensions = {
						tf = "terraform",
						tfvars = "terraform",
						tfstate = "json",
						hcl = "terraform",
					},
				},
			})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
