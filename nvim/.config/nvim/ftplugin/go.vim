setlocal textwidth=80
setlocal colorcolumn=+1
setlocal omnifunc=v:lua.vim.lsp.omnifunc

iabbrev ispew "github.com/davecgh/go-spew/spew"

PackerLoad nvim-lspconfig
LspStart
" autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
