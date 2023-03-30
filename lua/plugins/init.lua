return {
	{
		"arcticicestudio/nord-vim", -- The theme
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme nord]])
		end,
	},
	"nvim-tree/nvim-web-devicons", -- Some icons
	"nvim-lualine/lualine.nvim", -- Status bar

	-- General plugins
	"numToStr/Comment.nvim", -- Easy commenting
	"lukas-reineke/indent-blankline.nvim", -- Display indentation of blank lines
	"windwp/nvim-autopairs", -- Pair of things with cmp and treesitter integration
	"akinsho/toggleterm.nvim", -- A terminal
	"lewis6991/impatient.nvim", -- Performance improvements
	"ur4ltz/surround.nvim", -- Add, update or delete surrounding characers
	"lewis6991/gitsigns.nvim", -- Git diff in the gutter
	"nvim-tree/nvim-tree.lua", -- Simple file explorer
	"TimUntersberger/neogit", -- Magit clone from Neovim
	{
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
	},

	{
		"nvim-telescope/telescope.nvim", -- Much more than just a fuzzy finder
		dependencies = {
			"nvim-lua/plenary.nvim", -- Lua library
		},
	},
	"nvim-telescope/telescope-fzy-native.nvim", -- Faster(?) Telescope

	{
		"nvim-treesitter/nvim-treesitter", -- Treesitter integration
		build = ":TSUpdate",
		dependencies = {
			"p00f/nvim-ts-rainbow", -- Colors for things based on Treesitter
			"windwp/nvim-ts-autotag",
		},
	},

	"williamboman/mason.nvim", -- Simple to use language server installer
	"williamboman/mason-lspconfig.nvim", -- Integration with LSP config

	"jose-elias-alvarez/null-ls.nvim", -- Configure formatters & linters
	"jay-babu/mason-null-ls.nvim", -- Bridges gap b/w Mason & null-ls

	"neovim/nvim-lspconfig", -- Enable and configure LSP
	{ "glepnir/lspsaga.nvim", branch = "main" }, -- Enhanced LSP UIs
	"jose-elias-alvarez/typescript.nvim", -- Additional functionality for typescript server (e.g. rename file & update imports)

	{
		"hrsh7th/nvim-cmp", -- The completion plugin
		dependencies = {
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"L3MON4D3/LuaSnip", --snippet engine
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
			"hrsh7th/cmp-nvim-lsp", -- Completion for LSP
			"hrsh7th/cmp-nvim-lua", -- Completion for Lua
			"onsails/lspkind.nvim", -- VSCode like icons for autocompletion
		},
	},
}
