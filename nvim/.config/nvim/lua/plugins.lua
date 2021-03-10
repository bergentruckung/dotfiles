vim.cmd [[packadd packer.nvim]]

local packer = require("packer") local use = packer.use
local compile = packer.compile

return packer.startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- use {'9mm/vim-closer'}

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
    use {'tpope/vim-obsession', opt = true}
    -- Should probably be a builtin plugin
    use {'tpope/vim-surround'}
    -- Better undo tree
    use {'simnalamburt/vim-mundo', cmd = {'MundoToggle'}, opt = true}
    -- Go tools
    -- use {'fatih/vim-go', ft = {'go'}}
    -- Syntax highlighting for jinja2
    use {'Glench/Vim-Jinja2-Syntax', ft = {'jinja'}, opt = true}
    -- git commit browser
    use {'junegunn/gv.vim', cmd = {'GV'}, opt = true}
    -- puppet support
    -- use {'rodjek/vim-puppet', ft = {'puppet'}, opt = true}
    -- support for more languages
    -- use {'sheerun/vim-polyglot', opt = true}
    -- ack.vim for grep "
    use {'mileszs/ack.vim', cmd = {'Rg'}, opt = true}
    -- todo, notes, fixme viewer
    use {'vim-scripts/todo-vim', opt = true}
    -- distraction-free writing in vim
    use {'junegunn/goyo.vim', cmd = {'Goyo'}, opt = true}
    -- fuzzy file/buffer/whatever finder
    -- use {'junegunn/fzf', opt = true, config = 'require("plugins.fzf")'}
    -- -- fzf for vim
    -- use {'junegunn/fzf.vim', opt = true}
    -- -- ctrlpfunky for fzf
    -- use {'tracyone/fzf-funky', opt = true}
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
    -- use {'tybenz/vimdeck', opt = true}
    use {'godlygeek/tabular', cmd = {'Tabularize'}, opt = true}
    -- use {'rlofc/vorg', ft = {'vorg'}, opt = true}
    -- use {'kana/vim-textobj-user', opt = true}
    -- vim.cmd("Plug 'Julian/vim-textobj-brace'")
    -- vim.cmd("Plug 'glts/vim-textobj-comment'")
    -- vim.cmd("Plug 'ap/vim-css-color'")
    use {'moll/vim-bbye'}
    use {'bronson/vim-visual-star-search'}
    -- vim.cmd("Plug 'ap/vim-buftabline'")
    -- use {'tpope/vim-dispatch', opt = true}
    -- use {'dstein64/vim-startuptime', cmd = {'Startuptime'}, opt = true}
    use {'junegunn/vim-slash'}
    -- use {'prettier/vim-prettier', cmd = {'Prettier'}, opt = true}
    -- use {'ncm2/float-preview.nvim'}
    -- vim.cmd("Plug 'rhysd/git-messenger.vim'")
    use {'sebdah/vim-delve', ft = {'go'}, opt = true}
    -- Plug 'pechorin/any-jump.nvim'
    use {'thaerkh/vim-indentguides', ft = {'c', 'go', 'lua', 'python'}}
    use {'voldikss/vim-floaterm', opt = true, cmd = {'FloatermToggle'}}
    -- vim.cmd("Plug 'nvim-treesitter/nvim-treesitter'")
    use {'jpalardy/vim-slime', cmd = {'Slime'}, opt = true}
    use {'lambdalisue/fern.vim',  cmd = {'Fern'}, opt = true, config = 'require("plugins.fern")'}
    use {'psliwka/vim-smoothie'}
    -- vim.cmd("Plug 'wellle/context.vim', {'on': 'ContextEnable'}")
    use {'nvim-lua/popup.nvim'}

    use {'nvim-lua/plenary.nvim'}
    use {'neovim/nvim-lspconfig', config = 'require("plugins.lsp")'}
    use {'nvim-lua/completion-nvim', config = 'require("plugins.completions")'}
    use {'nvim-lua/telescope.nvim', config = 'require("plugins.telescope")'}

    use {'webdevel/tabulous', config= 'require("plugins.tabulous")'}

    use {'simeji/winresizer'}

    use {'vimwiki/vimwiki', config= 'require("plugins.vimwiki")', opt = true}

    use {'rust-lang/rust.vim', ft = {'rust'}, opt = true}

    use {'cespare/vim-toml', ft = {'toml'}, opt = true}

    use {'antoinemadec/FixCursorHold.nvim'}

    use {'nvim-telescope/telescope-fzy-native.nvim'}

    vim.g.completed_loading_plugins = true
end)
-- vim: set ts=4 sw=4 sts=0 noet :
