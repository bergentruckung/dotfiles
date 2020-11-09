let mapleader="\<Space>"
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" set packpath+=",/codemill/sethuraj/nvim"
lua require "init"
autocmd BufWritePost plugins.lua PackerCompile
