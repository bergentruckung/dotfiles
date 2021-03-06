vim.cmd [[packadd packer.nvim]]

vim._update_package_paths()

local packer = require("packer")
local use = packer.use
local compile = packer.compile

return packer.startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Simple plugins can be specified as strings
    use {'9mm/vim-closer'}

    -- Lazy loading:
    -- Load on specific commands
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    -- git helper
    use {'tpope/vim-fugitive'}
    -- handy bracket mappings
    use {'tpope/vim-unimpaired'}
    -- APIs for vimscript
    use {'ascenator/L9', as = 'newL9'}
    -- auto-pairs - autoclose brackets and stuff
    use {'jiangmiao/auto-pairs'}
    -- Commentary
    use {'tpope/vim-commentary'}
    -- vim-cpp-enhanced-highlight
    use {'octol/vim-cpp-enhanced-highlight', ft = {'cpp'}, opt = true}
    -- nix support
    use {'LnL7/vim-nix', ft = {'nix'}, opt = true}
    -- Session tracker for vim
    use {'tpope/vim-obsession'}
    -- Should probably be a builtin plugin
    use {'tpope/vim-surround'}
    -- Better undo tree
    use {'simnalamburt/vim-mundo', cmd = {'MundoToggle'}, opt = true}
    -- Go tools
    use {'fatih/vim-go', ft = {'go'}, opt = true}
    -- Syntax highlighting for jinja2
    use {'Glench/Vim-Jinja2-Syntax', ft = {'jinja'}, opt = true}
    -- git commit browser
    use {'junegunn/gv.vim', cmd = {'GV'}, opt = true}
    -- support for more languages
    use {'sheerun/vim-polyglot', opt = true}
    -- ack.vim for grep "
    use {'mileszs/ack.vim', cmd = {'Rg'}, opt = true}
    -- todo, notes, fixme viewer
    use {'vim-scripts/todo-vim', opt = true}
    -- distraction-free writing in vim
    use {'junegunn/goyo.vim', cmd = {'Goyo'}, opt = true}
    -- fuzzy file/buffer/whatever finder
    use {'junegunn/fzf', opt = true, config = 'require("plugins.fzf")'}
    -- fzf for vim
    use {'junegunn/fzf.vim', opt = true}
    -- ctrlpfunky for fzf
    use {'tracyone/fzf-funky', opt = true}
    -- MRU support for fzf
    -- vim.cmd("Plug 'pbogut/fzf-mru.vim'")
    -- Distraction free
    use {'junegunn/limelight.vim', cmd = {'Limelight'}, opt = true}
    -- pseudo command line, needed for fnr
    use {'junegunn/vim-pseudocl'}
    -- find n replace
    use {'junegunn/vim-fnr'}
    -- preview all the things inside your registers
    use {'junegunn/vim-peekaboo'}
    -- create presentations with vimdeck. Note that you need to install the gem
    -- first
    use {'tybenz/vimdeck', opt = true}
    use {'godlygeek/tabular', cmd = {'Tabularize'}, opt = true}
    use {'rlofc/vorg', ft = {'vorg'}, opt = true}
    use {'kana/vim-textobj-user', opt = true}
    -- vim.cmd("Plug 'Julian/vim-textobj-brace'")
    -- vim.cmd("Plug 'glts/vim-textobj-comment'")
    -- vim.cmd("Plug 'ap/vim-css-color'")
    use {'moll/vim-bbye'}
    use {'bronson/vim-visual-star-search'}
    use {'kkoomen/vim-doge', ft = {'go', 'python'}, opt = true}
    -- vim.cmd("Plug 'ap/vim-buftabline'")
    -- use {'tpope/vim-dispatch', opt = true}
    use {'dstein64/vim-startuptime', cmd = {'Startuptime'}, opt = true}
    use {'junegunn/vim-slash'}
    use {'prettier/vim-prettier', cmd = {'Prettier'}, opt = true}
    use {'ncm2/float-preview.nvim'}
    -- vim.cmd("Plug 'rhysd/git-messenger.vim'")
    use {'sebdah/vim-delve', ft = {'go'}, opt = true}
    -- Plug 'pechorin/any-jump.nvim'
    use {'thaerkh/vim-indentguides', ft = {'c', 'go', 'lua', 'python'}, opt = true}
    use {'voldikss/vim-floaterm'}
    -- vim.cmd("Plug 'direnv/direnv.vim'")
    -- vim.cmd("Plug 'neovim/nvim-lsp'")
    -- vim.cmd("Plug 'nvim-lua/completion-nvim'")
    -- vim.cmd("Plug 'nvim-lua/diagnostic-nvim'")
    -- vim.cmd("Plug 'nvim-treesitter/nvim-treesitter'")
    -- use {'neovim/nvim-lspconfig', opt = true}
    use {'jpalardy/vim-slime', cmd = {'Slime'}, opt = true}
    use {'lambdalisue/fern.vim',  cmd = {'Fern'}, opt = true}
    use {'psliwka/vim-smoothie'}
    -- vim.cmd("Plug 'wellle/context.vim', {'on': 'ContextEnable'}")
    use {'nvim-lua/popup.nvim'}
    -- vim.cmd("Plug 'nvim-lua/plenary.nvim'")
    -- vim.cmd("Plug 'nvim-lua/telescope.nvim'")

    -- manually load all the heavy plugins
    -- vim.cmd("packadd completion-nvim")
    -- vim.cmd("packadd diagnostic-nvim")
    -- use {'nvim-treesitter/nvim-treesitter', config = 'require("plugins.treesitter")'}
    -- use {'treesitter-context.nvim'}
    -- vim.cmd("packadd nvim-lspconfig")
    -- vim.cmd("packadd plenary.nvim")
    -- vim.cmd("packadd telescope.nvim")
    use {'nvim-lua/plenary.nvim'}
    use {'neovim/nvim-lspconfig', as = 'nvim_lsp', config = 'require("plugins.lsp")'}
    use {'nvim-lua/completion-nvim', config = 'require("plugins.completions")'}
    use {'nvim-lua/diagnostic-nvim', config = 'require("plugins.diagnostics")'}
    use {'nvim-lua/telescope.nvim', config = 'require("plugins.telescope")'}

    use {'webdevel/tabulous', config= 'require("plugins.tabulous")'}

    -- -- vf.plug['end']()

    -- -- import plugin specific settings
    -- require('plugins.lsp')
    -- require('plugins.diagnostics')
    -- require('plugins.completions')
    -- require('plugins.fzf')
    -- require('plugins.telescope')
    -- require('plugins.treesitter')
    -- compile()
    vim.g.completed_loading_plugins = true
    -- vim.cmd("filetype plugin indent on")
    -- vim.cmd("syntax on")
    -- compile()
end)
