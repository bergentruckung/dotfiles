let mapleader="\<Space>"
" Use <c-/> to jump forward in jump list
nnoremap <c-/> <c-i>
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set runtimepath=~/.dotfiles/nvim/.config/nvim/,$VIMRUNTIME
set packpath=~/.local/share/nvim/site/
" set runtimepath=~/.dotfiles/nvim/.config/nvim/,~/.local/share/nvim/site/pack/packer/start/,$VIMRUNTIME,~/.local/share/nvim/site/pack/packer/opt/
" set packpath=~/.local/share/nvim/site/

lua require "init"
autocmd BufWritePost *plugins.lua PackerCompile profile=true
" TODO: move to macros.lua
let @l = '$a	# noqa'
nnoremap <leader>l :normal @l<cr>

autocmd Filetype *.rs compiler cargo
silent nnoremap <leader>1 :make run<cr>
silent nnoremap <leader>2 :make build<cr>
silent nnoremap <leader>3 :copen<cr>
silent nnoremap <leader>4 :cclose<cr>
silent nnoremap <leader>5 :RustFmt<cr>

" function! StatuslineActive()
"     return luaeval('require("statusline").Active()')
" endfunction

" function! StatuslineInactive()
"     return luaeval('require("statusline").Inactive()')
" endfunction

" augroup Statusline
"   autocmd!
"   autocmd WinEnter,BufEnter * setlocal statusline=%!StatuslineActive()
"   autocmd WinLeave,BufLeave * setlocal statusline=%!StatuslineInactive()
" augroup END

let g:floaterm_title = " Von "
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100
" TODO: move this to abbreviations
iabbrev ispew "github.com/davecgh/go-spew/spew"

" FIXME: figure out why global variables are not getting set from inside lua
let g:winresizer_start_key = "<F7>"

" vim: set ts=4 sw=4 sts=0 noet :
