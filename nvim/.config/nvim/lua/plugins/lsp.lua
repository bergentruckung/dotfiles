-- nvim_lsp.SERVER.setup{config}

--   The `config` parameter has the same shape as that of
--   |vim.lsp.start_client()|, with these additions and changes:

--   {root_dir}
--     Required for some servers, optional for others.
--     Function of the form `function(filename, bufnr)`.
--     Called on new candidate buffers being attached-to.
--     Returns either a root_dir or nil.

--     If a root_dir is returned, then this file will also be attached. You
--     can optionally use {filetype} to help pre-filter by filetype.

--     If a root_dir is returned which is unique from any previously returned
--     root_dir, a new server will be spawned with that root_dir.

--     If nil is returned, the buffer is skipped.

--     See |nvim_lsp.util.search_ancestors()| and the functions which use it:
--     - |nvim_lsp.util.root_pattern(patterns...)| finds an ancestor which
--     - contains one of the files in `patterns...`. This is equivalent
--       to coc.nvim's "rootPatterns"
--     - Related utilities for common tools:
--       - |nvim_lsp.util.find_git_root()|
--       - |nvim_lsp.util.find_node_modules_root()|
--       - |nvim_lsp.util.find_package_json_root()|

--   {name}
--     Defaults to the server's name.

--   {filetypes}
--     Set of filetypes to filter for consideration by {root_dir}.
--     May be empty.
--     Server may specify a default value.

--   {log_level}
--     controls the level of logs to show from window/logMessage notifications. Defaults to
--     vim.lsp.protocol.MessageType.Warning instead of
--     vim.lsp.protocol.MessageType.Log.

--   {message_level}
--     controls the level of messages to show from window/showMessage notifications. Defaults to
--     vim.lsp.protocol.MessageType.Warning instead of
--     vim.lsp.protocol.MessageType.Log.

--   {settings}
--     Map with case-sensitive keys corresponding to `workspace/configuration`
--     event responses.
--     We also notify the server *once* on `initialize` with
--     `workspace/didChangeConfiguration`.
--     If you change the settings later on, you must emit the notification
--     with `client.workspace_did_change_configuration({settings})`
--     Example: `settings = { keyName = { subKey = 1 } }`

--   {on_attach}
--     `function(client)` executed with the current buffer as the one the {client}
--     is being attached-to. This is different from
--     |vim.lsp.start_client()|'s on_attach parameter, which passes the {bufnr} as
--     the second parameter instead. Useful for doing buffer-local setup.

--   {on_new_config}
--     `function(new_config)` will be executed after a new configuration has been
--     created as a result of {root_dir} returning a unique value. You can use this
--     as an opportunity to further modify the new_config or use it before it is
--     sent to |vim.lsp.start_client()|.

local lspconfig = require'lspconfig'

lspconfig.pyls.setup {
    -- on_attach=require'diagnostic'.on_attach, require'completion'.on_attach,
    -- require'completion'.on_attach,
    filetypes={'python'}
}
-- local nvim_lsp = require('lspconfig')
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.
--   local opts = { noremap=true, silent=true }
--   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

--   -- Set some keybinds conditional on server capabilities
--   if client.resolved_capabilities.document_formatting then
--     buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--   elseif client.resolved_capabilities.document_range_formatting then
--     buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--   end
  
--   -- Set autocommands conditional on server_capabilities
--   if client.resolved_capabilities.document_highlight then
--     require('lspconfig').util.nvim_multiline_command [[
--       :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--       :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--       :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--       augroup lsp_document_highlight
--         autocmd!
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]]
--   end
-- end

-- -- Use a loop to conveniently both setup defined servers 
-- -- and map buffer local keybindings when the language server attaches
-- local servers = { "gopls", "pyls" }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup { on_attach = on_attach }
-- end
