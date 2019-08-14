"Buffers"
"---------------"
set confirm
set hidden
nnoremap <BS> <C-^>
nnoremap <silent> <Tab> :bnext<cr>
nnoremap <silent> <S-Tab> :bprevious<cr>

"Searching"
"---------"
set incsearch
set ignorecase
set smartcase

"Leader mapping
"--------------
let mapleader="\<Space>"

"ctags are amazing
"-------------------
set tags=./tags,./TAGS,tags,TAGS,./myctags,myctags
noremap <S-5> <C-P><C-\>w
" noremap <Leader><c-d> <c-w>}

" Make manpages work in vim
" -------------------------
runtime! ftplugin/man.vim

"Autcommands"
"-----------"
au Filetype python set colorcolumn=79 ts=4 et sw=4
au BufRead * set t_Co=256
au BufReadPost quickfix nnoremap <buffer> <CR> <CR>

"Splitting"
"---------"
set splitbelow
set splitright

"Layout"
"------"
set autoindent
set number
set relativenumber
set wrapscan
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set wildmode=longest,list,full
set wildmenu

filetype plugin indent on

"gvim specific"
"-------------"
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
au GUIEnter * simalt ~x

"I hate swap files"
"-----------------"
set nobackup
set noswapfile

"Keyboard mapping"
"----------------"
noremap <silent> q :bd<cr>
noremap <leader>q :q<cr>
noremap <c-q> :wq<cr>
noremap <S-Right> $
noremap <S-Left> 0
noremap <Leader>tt :TagbarToggle<CR><C-w><Right>
noremap <Leader>w :%s/\s\+$//e<CR>
nnoremap <Leader>r :source $MYVIMRC<CR>
nnoremap <silent> <C-l> :nohl<CR>
nnoremap <silent> L :Ack!<CR>

"Time for a new beginning - 20190408
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap jk <Esc>
set timeout timeoutlen=250 ttimeoutlen=25
vnoremap jk <Esc>
nnoremap jk <Esc>
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap ^     <home>
cnoremap $     <end>
cnoremap jk <Esc>

"Abbreviations"
"-------------"
iab ipdb import ipdb; ipdb.set_trace()
iab abhi Abhijith Sethuraj <abhijithsethuraj4@gmail.com>
iab logrus log "github.com/sirupsen/logrus"
" cabbrev help tab help

"Tabs"
"----"
noremap ` :buffers<cr>

"Turn off bell"
"-------------"
set belloff=all

set nocompatible              " be viMproved
filetype on

"PLUGINS, PLUGINS AND MORE PLUGINS!"
"----------------------------------"
"#####vim-plug#####"
call plug#begin('~/.vim/plugged')

" Supertab - for tab completion "
Plug 'metalelf0/supertab'
" git helper
Plug 'tpope/vim-fugitive'
" APIs for vimscript "
Plug 'ascenator/L9', {'name': 'newL9'}
" ctrlp - fuzzy search "
Plug 'ctrlpvim/ctrlp.vim'
" auto-pairs - autoclose brackets and stuff "
Plug 'jiangmiao/auto-pairs'
" vim-autoformat - beautify "
Plug 'Chiel92/vim-autoformat'
" Tagbar "
Plug 'majutsushi/tagbar'
" Commentary "
Plug 'tpope/vim-commentary'
" python folds "
Plug 'tmhedberg/SimpylFold'
" Airline and friends"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Dracula colorscheme"
Plug 'dracula/vim'
" Auto-indentation "
Plug 'vim-scripts/indentpython.vim'
" Docstring viewer "
Plug 'fs111/pydoc.vim'
" Snip snip snip "
" Commonly used snippets "
Plug 'honza/vim-snippets'
" Startup screen for MRU files/buffers
Plug 'mhinz/vim-startify'
" gitgutter
Plug 'airblade/vim-gitgutter'
" clang_complete
Plug 'Rip-Rip/clang_complete'
" vim-cpp-enhanced-highlight"
Plug 'octol/vim-cpp-enhanced-highlight'
" Random colorscheme "
Plug 'mhartington/oceanic-next'
" Ps the github repo says, 'One colorscheme pack to rule them all'
Plug 'flazz/vim-colorschemes'
" nix support
Plug 'LnL7/vim-nix'
" ALE "
Plug 'w0rp/ale'
" Trust me, one of the best looking themes for vim "
Plug 'rakr/vim-one'
" Session tracker for vim "
Plug 'tpope/vim-obsession'
" this should probably be a builtin plugin
Plug 'tpope/vim-surround'
Plug 'simnalamburt/vim-mundo'
Plug 'junegunn/fzf'
Plug 'fatih/vim-go'
Plug 'tomasiser/vim-code-dark'
" COC - Conquer of Completions: no idea why it's not 'conqueror'"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python', {'do': 'yarn install --froze-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --froze-lockfile'}
" Shows up indentlines "
Plug 'Yggdroot/indentLine'
" Multi cursor vim "
Plug 'terryma/vim-multiple-cursors'
" Syntax highlighting for jinja2 "
Plug 'Glench/Vim-Jinja2-Syntax'
" Current line indicator (yes, it works with colorschemes) "
" Plug 'miyakogi/conoline.vim'
" Uses regex to jump between functions. Extn for ctrlp "
Plug 'tacahiroy/ctrlp-funky'
" git commit browser "
Plug 'junegunn/gv.vim'
" support for language packs "
Plug 'sheerun/vim-polyglot'
" ack.vim for grep "
Plug 'mileszs/ack.vim'
" simple todo list for vim "
Plug 'vitalk/vim-simple-todo'
" todo, notes, fixme viewer
Plug 'vim-scripts/todo-vim'
" distraction-free writing in vim
Plug 'junegunn/goyo.vim'
" swap words
Plug 'kurkale6ka/vim-swap'

call plug#end()
filetype plugin indent on    " required

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>

"###################"
"Pydoc"
"-----"
let g:pydoc_open_cmd = 'tabnew'

" ctrlP"
"-----"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <Leader>p :CtrlPTag<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ }
let g:ctrlp_match_current_file = 1

"NERDTree"
"--------"
" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd Vimenter * wincmd w

"vim-autoformat"
"--------------"
noremap <Leader>a :Autoformat<CR>

"SimpylFold"
"----------"
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 1
let g:SimpylFold_fold_docstring = 0

"Airline"
"-------"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "one"
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_highlighting_cache=1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"Highlight my errors
" -------------------
highlight SpellBad term=reverse ctermbg=141
highlight ColorColumn ctermbg=141

if has('gui_running')
    set clipboard=unnamedplus
    " weird hack since gvim isn't liking my approach"
    inoremap <S-Insert> <C-R>*
endif

"Clang complete"
"--------------"
" path to directory where library can be found
let g:clang_library_path='/usr/lib64/llvm/'

"vim-cpp-enhanced highlight"
"--------------------------"
" Highlighting of class scope is disabled by default. To enable set
let g:cpp_class_scope_highlight = 1
" Highlighting of member variables is disabled by default. To enable set
let g:cpp_member_variable_highlight = 1
" Highlighting of class names in declarations is disabled by default. To enable set
let g:cpp_class_decl_highlight = 1
" There are two ways to highlight template functions. Either
let g:cpp_experimental_simple_template_highlight = 1
" which works in most cases, but can be a little slow on large files. Alternatively set
let g:cpp_experimental_template_highlight = 1
" Highlighting of library concepts is enabled by
let g:cpp_concepts_highlight = 1

"vim-autopairs"
"-------------
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn

"coc.nvim"
"--------
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

"coc-snippets"
"------------
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)

"ALE"
"---
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 0
let g:ale_lint_on_save = 0
nnoremap <Leader><c-l> :ALELint<CR>

"vim-obsession"
"-------------"
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '##OBSESSED##'

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <c-a> :ZoomToggle<cr>

"cscope
"------
" setup
if has("cscope")
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $cscope_db != ""
        cs add $cscope_db
    endif
    set csverb
endif

" jump to a function declaration
nmap <leader> <c-\> :cs find s <c-r>=expand("<cword>")<cr><cr>1<cr><cr>
" show a list of where function is called
nmap <leader> <c-_> :cs find c <c-r>=expand("<cword>")<cr><cr>"colorscheme"
"-----------"
let g:rehash256 = 1
syntax enable
" highlight colorline ctermbg=black
set background=dark
colorscheme one
" i'd like my autucompletion menu to have custom colors "
highlight pmenu ctermbg=black ctermfg=gray
highlight pmenusel ctermbg=darkgray ctermfg=black

" close quick fix window if that's the only one remaining
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

"quickfix window"
"---------------

map <C-n> :cnext<cr>
map <C-b> :cprevious<cr>
nnoremap <Leader>a :cclose<cr>

" golang
" ------
au Filetype go nmap <buffer> <Leader>b <Plug>(go-build)
au Filetype go nmap <buffer> <Leader>r <Plug>(go-run)
au Filetype go nmap <buffer> <Leader>d <Plug>(go-doc-vertical)
au Filetype go nmap <buffer> <Leader>a <Plug>(go-fmt)
au Filetype go nmap <buffer> <Leader><c-d> <Plug>(go-def-vertical)
" au BufWritePost *.go silent! !myctags
au Filetype go set autowrite
let g:SuperTabDefaultCompletionTypeDiscovery = [
            \ "&completefunc:<c-x><c-u>",
            \ "&omnifunc:<c-x><c-o>",
            \ ]
let g:SuperTabLongestHighlight = 1
let g:go_null_module_warning = 0
let g:go_fmt_command = "goimports"

" multicursor"
" -----------
let g:multi_cursor_quit_key = '<Esc>'

"SuperTab"
"--------"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabCrMapping = 0

"Indentline"
"----------
let g:indentLine_setColors = 0

"vim-mundo"
"---------
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo
nnoremap <leader>u :MundoToggle<cr>

"ctrlp-funky"
"-----------
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"ack.vim"
"-------
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

"vim-todo"
"-------k
let g:todo_autopreview = 1
nnoremap <buffer> <Leader>t :TODOToggle<CR>

"vim-simple-todo"
"---------------
let g:simple_todo_map_keys = 0
au Filetype markdown nmap <buffer> <leader>i <Plug>(simple-todo-new)
au Filetype markdown nmap <buffer> <leader>I <Plug>(simple-todo-new-start-of-line)
au Filetype markdown nmap <buffer> <leader>s <Plug>(simple-todo-mark-switch)
let g:simple_todo_tick_symbol = '✓'


"END"
"---"
