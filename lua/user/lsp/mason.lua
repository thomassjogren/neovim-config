local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		-- "volar", -- Vue 3
		"vuels", -- Vue 2
		"tsserver",
		"terraformls",
		"yamlls",
		"cssls",
		"html",
		"lua_ls",
		"gopls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"prettier",
		"golangci-lint",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
