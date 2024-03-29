-- Turn these off at startup, will be enabled later just before loading the theme
-- vim.cmd([[
--     syntax off
--     filetype off
--     filetype plugin indent off
-- ]])
vim.o.clipboard = "unnamed,unnamedplus"
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.swapfile = false
vim.bo.tabstop = 4
vim.o.autoindent = true
vim.o.background = "dark"
vim.o.backspace = "indent,eol,start"
vim.o.backup = false
vim.o.breakindent = true
vim.o.cmdheight = 1
vim.o.complete = ".,w,b,u,t,i"
vim.o.completeopt = "menuone,noinsert"
vim.o.confirm = true
vim.o.encoding = "utf-8"
vim.o.hidden = true
vim.o.history =  100
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.incsearch = true
vim.o.infercase = true
vim.o.laststatus = 2
vim.o.lazyredraw = false
vim.o.listchars = "tab:▸ ,eol:↲,trail:•,extends:»,precedes:«,tab:| ,trail:·"
vim.o.matchtime = 2
vim.o.modeline = false
vim.o.mouse = "a"
vim.o.pumheight = 15
vim.o.shada = ""
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.showbreak = "+++ "
vim.o.showmatch = true
vim.o.showmatch = true
vim.o.showmode = false
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.ttimeout = true
vim.o.ttimeoutlen = 300
vim.o.updatetime = 300
vim.o.wildmenu = true
vim.o.wildmode = "longest,list,full"
-- vim.o.winbar = "%=%m %f"
vim.o.wrapscan = true
vim.o.writebackup = false
vim.wo.conceallevel = 2
vim.wo.cursorline = false
vim.wo.list = false
vim.wo.number = true
vim.wo.numberwidth = 5
vim.wo.relativenumber = true
vim.wo.signcolumn = "auto"
vim.o.guifont = "BitstreamVeraSansMono Nerd Font:h9"
-- vim.o.langmap="dg,ek,fe,gt,il,jy,kn,lu,nj,pr,rs,sd,tf,ui,yo,op,DG,EK,FE,GT,IL,JY,KN,LU,NJ,PR,RS,SD,TF,UI,YO,OP"
