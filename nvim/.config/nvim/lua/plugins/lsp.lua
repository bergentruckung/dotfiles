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

local nvim_lsp = require'nvim_lsp'

nvim_lsp.pyls.setup {
    on_attach=require'diagnostic'.on_attach, require'completion'.on_attach,
    filetypes={'python'}
}
