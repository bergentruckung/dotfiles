setlocal textwidth=80
setlocal colorcolumn=+1
setlocal omnifunc=v:lua.vim.lsp.omnifunc

iabbrev ipdb import ipdb; ipdb.set_trace()

PackerLoad nvim-lspconfig
lua << EOF
require'lspconfig'.rust_analyzer.setup{}
EOF
