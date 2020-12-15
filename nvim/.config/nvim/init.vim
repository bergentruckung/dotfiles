let mapleader="\<Space>"
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

lua require "init"
autocmd BufWritePost plugins.lua PackerCompile
" TODO: move to macros.lua
let @l = '$a	# noqa'
nnoremap <leader>l :normal @l<cr>
" vim: set ts=4 sw=4 sts=0 noet :
