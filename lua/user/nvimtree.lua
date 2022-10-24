local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
