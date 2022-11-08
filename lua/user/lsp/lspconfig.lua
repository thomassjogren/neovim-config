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
	keymap("n", "gf", "<cmd>Lspsaga lsp_finder<cr>", bufopts) -- show definition, references
	keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", bufopts) -- got to declaration
	keymap("n", "gd", "<cmd>Lspsaga peek_definition<cr>", bufopts) -- see definition and make edits in window
	keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", bufopts) -- go to implementation
	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", bufopts) -- see available code actions
	keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", bufopts) -- smart rename
	keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<cr>", bufopts) -- show  diagnostics for line
	keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<cr>", bufopts) -- show diagnostics for cursor
	keymap("n", "<leader>dk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", bufopts) -- jump to previous diagnostic in buffer
	keymap("n", "<leader>dj", "<cmd>Lspsaga diagnostic_jump_next<cr>", bufopts) -- jump to next diagnostic in buffer
	keymap("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", bufopts) -- jump to next diagnostic in buffer
	keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", bufopts) -- show documentation for what is under cursor

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap("n", "<leader>rf", "<cmd>TypescriptRenameFile<cr>") -- rename file and update imports
		keymap("n", "<leader>oi", "<cmd>TypescriptOrganizeImports<cr>") -- organize imports (not in youtube nvim video)
		keymap("n", "<leader>ru", "<cmd>TypescriptRemoveUnused<cr>") -- remove unused variables (not in youtube nvim video)
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

-- Vuejs 3 - conflicting with vuels when both running
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
