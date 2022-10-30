# neovim-config

Place the shit in `~/.config/nvim/`

Will throw a million errors when starting Neovim but should try installing all plugins automatically. If not, try run `:PackerInstall` and if that fails, look up installing Packer manually.

## Plugins

  General
	- wbthomason/packer.nvim - Plugin manager (that manages itself)
	- nvim-lua/popup.nvim - An implementation of the Popup API from vim in Neovim
	- nvim-lua/plenary.nvim - Useful lua functions used ny lots of plugins
	- windwp/nvim-autopairs - Auto parenthesis, quotes and stuff pairs
	- numToStr/Comment.nvim - Comment stuff like a champ
	- akinsho/toggleterm.nvim - Integrated terminal
	- lewis6991/impatient.nvim - Performance improvements
	- ur4ltz/surround.nvim - Add, replace, delete surrounding characters
	- lukas-reineke/indent-blankline.nvim - Indentation lines, also for blank lines
	- nvim-tree/nvim-tree.lua - Simple file explorer
	- windwp/nvim-ts-autotag - Auto close tags (HTML and stuff)
	- nathom/filetype.nvim - Detect filetypes, faster

  Visuals
	- kyazdani42/nvim-web-devicons - Stupid icons for stuff
	- arcticicestudio/nord-vim - Nord theme (Only the best ofc)
	- NTBBloodbath/galaxyline.nvim - Status line

	Completion, Snippets
	- hrsh7th/nvim-cmp - The completion plugin
	- hrsh7th/cmp-buffer - Buffer completions
	- hrsh7th/cmp-path - Path completions
	- saadparwaiz1/cmp_luasnip - Snippet completions
	- L3MON4D3/LuaSnip - Snippet engine
	- rafamadriz/friendly-snippets - A bunch of snippets to use
	- hrsh7th/cmp-nvim-lsp - LSP integration with completion
	- hrsh7th/cmp-nvim-lua - Lua completions (Not needed?)

	LSP
	- williamboman/mason.nvim - Simple to use language server installer
	- williamboman/mason-lspconfig.nvim - Mason <-> LSP integration
	- neovim/nvim-lspconfig - Configure LSP
	- glepnir/lspsaga.nvim - Enhanced LSP UIs
	- jose-elias-alvarez/typescript.nvim - Additional functionality for typescript server (e.g. rename file & update imports)
	- onsails/lspkind.nvim - VSCode like icons for autocompletion

	Formatting & linting
	- jose-elias-alvarez/null-ls.nvim - Configure formatters & linters
	- jayp0521/mason-null-ls.nvim - Bridges gap b/w mason & null-ls

  Telescope
	- nvim-telescope/telescope.nvim - Fuzzy finder delux
	- nvim-telescope/telescope-fzy-native.nvim - Faster fzy finding

	Treesitter
	- nvim-treesitter/nvim-treesitter - Powerful generation and parsing of syntax trees
	- p00f/nvim-ts-rainbow - Make it a rainbox (paranthesis and stuff)

	-- Git
	- lewis6991/gitsigns.nvim - Display changes to files in the gutter
