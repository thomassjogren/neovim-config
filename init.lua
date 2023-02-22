local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Need to map leader key before Lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("plugins")

require("options")
require("keymaps")
require("user.comment")
require("user.indentline")
require("user.telescope")
require("user.treesitter")
require("user.lsp.mason")
require("user.lsp.null-ls")
require("user.lsp.lspsaga")
require("user.lsp.lspconfig")
require("user.lualine")
require("user.cmp")
require("user.autopairs")
require("user.gitsigns")
require("user.toggleterm")
require("user.impatient")
require("user.surround")
require("user.nvimtree")
require("user.neogit")
