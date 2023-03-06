setlocal textwidth=80
setlocal colorcolumn=+1
" setlocal omnifunc=v:lua.vim.lsp.omnifunc
setlocal number
setlocal relativenumber
setlocal nospell

iabbrev ipdb import ipdb; ipdb.set_trace()

" PackerLoad nvim-lspconfig
" PackerLoad nvim-treesitter
" PackerLoad nvim-treesitter-context
" PackerLoad cmp-nvim-lsp
" PackerLoad nvim-cmp
" LspStart
" autocmd BufWritePre *.py lua vim.lsp.buf.format()
