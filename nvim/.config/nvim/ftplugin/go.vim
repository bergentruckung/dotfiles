setlocal textwidth=80
setlocal colorcolumn=+1
setlocal cursorline
setlocal number
setlocal relativenumber
" setlocal list
" setlocal spell

iabbrev ispew "github.com/davecgh/go-spew/spew"
iabbrev ilog log "github.com/sirupsen/logrus"

" PackerLoad nvim-lspconfig
" PackerLoad nvim-treesitter
" PackerLoad nvim-treesitter-context
" LspStart
autocmd BufWritePre *.go lua vim.lsp.buf.format()
