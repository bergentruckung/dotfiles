vim.cmd("autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc")
-- vim.cmd("autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)")
vim.cmd("autocmd BufEnter */tmp/odin_model_* set filetype=yaml")
vim.cmd("autocmd BufEnter *.pp set filetype=puppet")
