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
set cmdheight=2
set noshowmode

filetype plugin indent on
set complete+=i


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
noremap <silent> q :Bdelete<cr>
noremap <silent><leader>q :close<cr>
noremap <c-q> :wq<cr>
noremap <Leader>tt :TagbarToggle<CR><C-w><Right>
noremap <Leader>w :%s/\s\+$//e<CR>
" nnoremap <Leader>r :source $MYVIMRC<CR>
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
iab abhi Abhijith Sethuraj
iab Author: Author: Abhijith Sethuraj <abhijithsethuraj4@deshaw.com>
iab minauth Author: bergentruckung
iab logrus log "github.com/sirupsen/logrus"

"Turn off bell"
"-------------"
set belloff=all

"be viMproved
set nocompatible

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
" ctrlp - fuzzy search " - REALLY good plugin, but retired in favour of FZF
" Plug 'ctrlpvim/ctrlp.vim'
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
" Trust me, one of the best looking themes for vim "
Plug 'rakr/vim-one'
" Session tracker for vim "
Plug 'tpope/vim-obsession'
" this should probably be a builtin plugin
Plug 'tpope/vim-surround'
Plug 'simnalamburt/vim-mundo'
Plug 'fatih/vim-go'
Plug 'tomasiser/vim-code-dark'
" COC - Conquer of Completions: no idea why it's not 'conqueror'"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Multi cursor vim "
Plug 'terryma/vim-multiple-cursors'
" Syntax highlighting for jinja2 "
Plug 'Glench/Vim-Jinja2-Syntax'
" Uses regex to jump between functions. Extn for ctrlp "
" Plug 'tacahiroy/ctrlp-funky'
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
" highlights yank-ed stuff
Plug 'machakann/vim-highlightedyank'
" print the signature onto command line space/virtual print during completion
Plug 'Shougo/echodoc.vim'
" print signature anytime 
Plug 'skywind3000/vim-preview'
" fuzzy file/buffer/whatever finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" ctrlpfunky for fzf
Plug 'tracyone/fzf-funky'
" MRU support for fzf
Plug 'pbogut/fzf-mru.vim'
" Distraction free 
Plug 'junegunn/limelight.vim'
" pseudo command line, needed for fnr
Plug 'junegunn/vim-pseudocl'
" find n replace
Plug 'junegunn/vim-fnr'
" preview all the things inside your registers
Plug 'junegunn/vim-peekaboo'
" use ALE for linting
Plug 'dense-analysis/ale'
" create presentations with vimdeck. Note that you need to install the gem
" first
Plug 'tybenz/vimdeck'
Plug 'godlygeek/tabular'
Plug 'rlofc/vorg'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-brace'
Plug 'glts/vim-textobj-comment'
Plug 'TaDaa/vimade'
Plug 'ap/vim-css-color'
Plug 'moll/vim-bbye'

call plug#end()
filetype plugin indent on    " required

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>

"###################"
"Pydoc"
"-----"
let g:pydoc_open_cmd = 'tabnew'

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
" use bubblegum if it's hybrid
let g:airline_theme = "zenburn"
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
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
        call CocActionAsync('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

autocmd Filetype go nnoremap <leader>l :GoFmt<cr>
set updatetime=300
set signcolumn=yes
set shortmess+=c

"coc-snippets"
"------------
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)


"vim-obsession"
"-------------"
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '##OBSESSED##'
nnoremap <leader>o :Obsession<cr>

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
syntax enable
" highlight colorline ctermbg=black
set background=dark
" only if you use seoul256
let g:seoul256_background = 236
colorscheme seoul256
set cursorline
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

" close quick fix window if that's the only one remaining
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

"location list"
"---------------

nnoremap <c-j> :lnext<cr>
nnoremap <c-k> :lprev<cr>

" golang
" ------
au Filetype go nmap <buffer> <Leader>b <Plug>(go-build)
au Filetype go nmap <buffer> <Leader>d <Plug>(go-doc)
au Filetype go nmap <buffer> <Leader>a <Plug>(go-fmt)
au Filetype go nmap <buffer> <Leader>i <Plug>(go-info)
au Filetype go nmap <buffer> <Leader><c-d> <Plug>(go-def)
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

"ack.vim"
"-------
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

"vim-todo"
"--------
let g:todo_autopreview = 1
nnoremap <buffer> <Leader>t :TODOToggle<CR>

"vim-simple-todo"
"---------------
let g:simple_todo_map_keys = 0
au Filetype markdown nmap <buffer> <leader>i <Plug>(simple-todo-new)
au Filetype markdown nmap <buffer> <leader>I <Plug>(simple-todo-new-start-of-line)
au Filetype markdown nmap <buffer> <leader>s <Plug>(simple-todo-mark-switch)
let g:simple_todo_tick_symbol = '✓'

"echodoc
"-------
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = "virtual"

"FZF
"---
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

autocmd! User FzfStatusLine call <SID>fzf_statusline()
nnoremap <silent> <C-p> :Buffers<cr>
nnoremap <silent> <C-t> :Files<cr>
nnoremap <silent> <leader>p :FZFMru<cr>
nnoremap <silent> <leader>f :CtrlPFunky<cr>
nnoremap <silent> <leader>; :History:<cr>
nnoremap <silent> <leader>/ :Line<cr>
nnoremap <silent> <leader>s :Rg<cr>
nnoremap <silent> <leader>c :Commits<cr>
nnoremap <silent> <leader>h :Helptags<cr>

"Limelight
"---------
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

"Show time while saving
augroup SAVING
    autocmd!
    autocmd BufWritePost * echo strftime('%c')
augroup END

"FNR
"---
nmap <Leader>r <Plug>(FNR)
xmap <Leader>r <Plug>(FNR)
nmap <Leader>R <Plug>(FNR%)
xmap <Leader>R <Plug>(FNR%)


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

"ALE"
"---
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 0
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1
let g:ale_keep_list_window_open = 1 
nnoremap <Leader>l :ALELint<CR>
let g:ale_fixers = {
\   'python': [
\       'add_blank_lines_for_python_control_statements',
\       'black',
\       'reorder-python-imports',
\       'yapf',
\   ],
\}
let g:ale_set_highlights = 0
highlight ALEErrorLine ctermfg=red
highlight ALEWarningLine ctermfg=yellow

""
"END"
"---"
