local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap.set

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- keybind options
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap("n", "gf", ":Lspsaga lsp_finder<CR>", bufopts) -- show definition, references
	keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", bufopts) -- got to declaration
	keymap("n", "gd", ":Lspsaga peek_definition<CR>", bufopts) -- see definition and make edits in window
	keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", bufopts) -- go to implementation
	keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", bufopts) -- see available code actions
	keymap("n", "<leader>rn", ":Lspsaga rename<CR>", bufopts) -- smart rename
	keymap("n", "<leader>d", ":Lspsaga show_line_diagnostics<CR>", bufopts) -- show  diagnostics for line
	keymap("n", "<leader>d", ":Lspsaga show_cursor_diagnostics<CR>", bufopts) -- show diagnostics for cursor
	keymap("n", "<d", ":Lspsaga diagnostic_jump_prev<CR>", bufopts) -- jump to previous diagnostic in buffer
	keymap("n", ">d", ":Lspsaga diagnostic_jump_next<CR>", bufopts) -- jump to next diagnostic in buffer
	keymap("n", "K", ":Lspsaga hover_doc<CR>", bufopts) -- show documentation for what is under cursor

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- Vuejs 3
-- lspconfig["volar"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- Vuejs 2
lspconfig["vuels"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["terraformls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["yamlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["phpactor"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
