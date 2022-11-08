local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		theme = "nord",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},

	-- Quite minimal configuration of the sections
	sections = {
		lualine_a = {},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = {},
		lualine_z = { "location" },
	},
})
