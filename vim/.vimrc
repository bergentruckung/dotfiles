"----------------------
" bergentruckung's vim 
"----------------------
if !empty(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

"
"Buffers"
"-------"
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
set infercase

"Leader mapping
"--------------
let mapleader="\<Space>"

"ctags are amazing
"-------------------
set tags=./tags,./TAGS,tags,TAGS,./myctags,myctags
noremap <S-5> <C-P><C-\>w

" Make manpages work in vim
" -------------------------
" runtime! ftplugin/man.vim

"Autcommands"
"-----------"
augroup bergentruckung
    autocmd!
augroup END


au bergentruckung BufRead * set t_Co=256
au bergentruckung VimResized * wincmd =
au bergentruckung BufReadPost quickfix nnoremap <buffer> <CR> <CR>
au bergentruckung Filetype git set nofoldenable

" vimdiff specific
if &diff
    set cursorbind
endif

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
set cmdheight=2
set showmode
set lazyredraw
set mouse=a
set backspace=2
set showbreak="+++ "
set showmatch
set matchtime=2
let &showbreak = '--- '
set listchars=tab:▸\ ,eol:¬,trail:•,extends:»,precedes:«
set breakindent


" filetype plugin indent on
set complete+=i

"spell check"
"-----------"
autocmd bergentruckung FileType vorg set spell
autocmd bergentruckung FileType gitcommit setlocal spell


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
noremap <silent><leader>q :Bdelete<cr>
noremap <silent>Q :close<cr>
noremap <c-q> :wq<cr>
noremap <Leader>tt :TagbarToggle<CR><C-w><Right>
noremap <Leader>w :%s/\s\+$//e<CR>
" nnoremap <Leader>r :source $MYVIMRC<CR>
nnoremap <silent> <C-l> :nohl<CR>

"Time for a new beginning - 20190408
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
" inoremap jk <Esc>
" set timeout timeoutlen=250 ttimeoutlen=25
" vnoremap jk <Esc>
" nnoremap jk <Esc>
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

nnoremap s <c-w>
nnoremap ss :w<CR>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"Abbreviations"
"-------------"
iab ipdb import ipdb; ipdb.set_trace()
iab abhi Abhijith Sethuraj
iab Author: Author: Abhijith Sethuraj <abhijithsethuraj4@gmail.com>
iab minauth Author: bergentruckung
iab logrus log "github.com/sirupsen/logrus"

"Turn off bell"
"-------------"
set belloff=all

"be viMproved
set nocompatible

filetype on

"Highlight my errors
" -------------------
highlight SpellBad term=reverse ctermbg=141
highlight ColorColumn ctermbg=141

if has('gui_running')
    set clipboard=unnamedplus
    " weird hack since gvim isn't liking my approach"
    inoremap <S-Insert> <C-R>*
endif

augroup sourcesession
        autocmd!
        autocmd bergentruckung VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
        \   source Session.vim |
        \ endif
augroup END

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

" look and feel
"-------------"
let g:rehash256 = 1
" syntax enable
" highlight colorline ctermbg=black
set background=dark
" only if you use seoul256
let g:seoul256_background = 236
set termguicolors
let zenburn_high_Contrast=0
let zenburn_alternate_Visual=1
colorscheme zenburn
set nocursorline
highlight WildMenu ctermfg=black ctermbg=white
highlight Comment ctermfg=darkgrey
highlight IncSearch ctermfg=172
highlight LineNr ctermfg=59
highlight Visual term=reverse cterm=reverse
" I'd like my autucompletion menu to have custom colors "
" Use this for anything other than seoul256
" highlight pmenu ctermbg=black ctermfg=gray
" highlight pmenusel ctermbg=darkgray ctermfg=black
" Use this for seoul256
" highlight Pmenu ctermbg=237 ctermfg=59
highlight Pmenusel ctermfg=black ctermbg=109
highlight Pmenu ctermfg=grey ctermbg=black
" highlight BufTabLineActive cterm=bold ctermfg=187 guifg=#DFBC72
highlight link BufTabLineActive DiffDelete

" close quick fix window if that's the only one remaining
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

"location list"
"---------------

nnoremap <leader><c-j> :lnext<cr>
nnoremap <leader><c-k> :lprev<cr>


" Search within a scope (a {...} program block) - stolen from somewhere
" ---------------------------------------------
" Stolen from -> Version 2010-02-28 from http://vim.wikia.com/wiki/VimTip1530

" Search within top-level block for word at cursor, or selected text.
nnoremap <Leader>[ /<C-R>=<SID>ScopeSearch('[[', 1)<CR><CR>
vnoremap <Leader>[ <Esc>/<C-R>=<SID>ScopeSearch('[[', 2)<CR><CR>gV
" Search within current block for word at cursor, or selected text.
nnoremap <Leader><space> /<C-R>=<SID>ScopeSearch('[{', 1)<CR><CR>
vnoremap <silent> <Leader><space> <Esc>/<C-R>=<SID>ScopeSearch('[{', 2)<CR><CR>gV
" Search within current top-level block for user-entered text.
" nnoremap <Leader>/ /<C-R>=<SID>ScopeSearch('[[', 0)<CR>
" vnoremap <Leader>/ <Esc>/<C-R>=<SID>ScopeSearch('[[', 2)<CR><CR>

" Return a pattern to search within a specified scope, or
" return a backslash to cancel search if scope not found.
" navigator: a command to jump to the beginning of the desired scope
" mode: 0=scope only; 1=scope+current word; 2=scope+visual selection
function! s:ScopeSearch(navigator, mode)
    if a:mode == 0
        let pattern = ''
    elseif a:mode == 1
        let pattern = '\<' . expand('<cword>') . '\>'
    else
        let old_reg = getreg('@')
        let old_regtype = getregtype('@')
        normal! gvy
        let pattern = escape(@@, '/\.*$^~[')
        call setreg('@', old_reg, old_regtype)
    endif
    let saveview = winsaveview()
    execute 'normal! ' . a:navigator
    let first = line('.')
    normal %
    let last = line('.')
    normal %
    call winrestview(saveview)
    if first < last
        return printf('\%%>%dl\%%<%dl%s', first-1, last+1, pattern)
    endif
    return "\b"
endfunction

"netrw"
"-----
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
highlight netrwExe cterm=bold ctermfg=187 ctermbg=23 gui=bold guifg=#DFDEBD guibg=#007173
highlight netrwDir ctermfg=252 ctermbg=24 guifg=#D9D9D9 guibg=#007299

"Neovim terminal customizations
"------------------------------
" Terminal Function from https://www.reddit.com/r/vim/comments/8n5bzs/using_neovim_is_there_a_way_to_display_a_terminal/
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
            set nocursorline
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap :q <C-\><C-n>:q!<CR>
tnoremap <leader><leader> <C-\><C-n><C-w><C-p>

" Restore cursor position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

autocmd BufWritePost $MYVIMRC source $MYVIMRC

" autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" sort words on a line
vnoremap <leader>s d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

au BufRead odin_model_* set filetype=yaml

"
"END"
"---"
