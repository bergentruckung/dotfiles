setlocal textwidth=80
setlocal colorcolumn=+1
setlocal omnifunc=v:lua.vim.lsp.omnifunc

PackerLoad nvim-lspconfig
LspStart
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
