vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local use = packer.use

return packer.startup(function() -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', event = "BufEnter"}
    use {'nvim-lua/plenary.nvim', event = "BufEnter"}
    use {'nvim-lua/popup.nvim', after = "plenary.nvim"}
    use {'nvim-telescope/telescope.nvim', after = "popup.nvim", cmd = "Telescope", config = function() require("plugin_configs.my_telescope") end}
    -- git helper
    use {'tpope/vim-fugitive', cmd = {'GV'}, opt = true}
    -- handy bracket mappings
    use {'tpope/vim-unimpaired', event = "CursorHold"}
    -- APIs for vimscript
    -- use {'ascenator/L9', as = 'newL9'}
    -- auto-pairs - autoclose brackets and stuff
    -- use {'jiangmiao/auto-pairs', event = "CursorHold"}
    use {'windwp/nvim-autopairs', event = "CursorHold", config = function() require("plugin_configs.my_autopairs") end}
    -- Commentary
    -- use {'tpope/vim-commentary'}
    use {'b3nj5m1n/kommentary', event = "VimEnter"}
    -- -- vim-cpp-enhanced-highlight
    -- use {'octol/vim-cpp-enhanced-highlight', ft = {'cpp'}, opt = true}
    -- -- nix support
    -- use {'LnL7/vim-nix', ft = {'nix'}, opt = true}
    -- Session tracker for vim
    -- use {'tpope/vim-obsession', opt = true, cmd = {'Obsession'}}
    -- Should probably be a builtin plugin
    use {'tpope/vim-surround', event = "CursorHold"}
    -- Better undo tree
    -- use {'simnalamburt/vim-mundo', cmd = {'MundoToggle'}, opt = true, disable = true}
    -- Go tools

    -- Syntax highlighting for jinja2
    -- use {'Glench/Vim-Jinja2-Syntax', ft = {'jinja'}, opt = true}
    -- git commit browser
    use {'junegunn/gv.vim', after = "vim-fugitive", opt = true}
    -- puppet support
    use {'rodjek/vim-puppet', ft = {'puppet', 'epuppet'}, opt = true}
    -- support for more languages
    -- use {'sheerun/vim-polyglot', opt = true}
    -- ack.vim for grep "
    -- use {'mileszs/ack.vim', cmd = {'Rg'}, opt = true}
    -- todo, notes, fixme viewer
    -- use {'vim-scripts/todo-vim', opt = true, cmd = {'TodoToggle'}, disable = true}
    -- distraction-free writing in vim
    use {'junegunn/goyo.vim', cmd = {'Goyo'}, opt = true}
    -- fuzzy file/buffer/whatever finder
    -- use {'junegunn/fzf', opt = true, config = 'require("plugin_configs.fzf")'}
    -- -- fzf for vim
    -- use {'junegunn/fzf.vim', opt = true}
    -- -- ctrlpfunky for fzf
    -- use {'tracyone/fzf-funky', opt = true}
    -- MRU support for fzf
    -- vim.cmd("Plug 'pbogut/fzf-mru.vim'")
    -- Distraction free
    use {'junegunn/limelight.vim', cmd = {'Limelight'}, opt = true}
    -- pseudo command line, needed for fnr
    -- use {'junegunn/vim-pseudocl', cmd = "VimEnter"}
    -- find n replace
    -- use {'junegunn/vim-fnr', cmd = "VimEnter"}
    -- preview all the things inside your registers
    use {'junegunn/vim-peekaboo', event = "CursorHold"}
    -- create presentations with vimdeck. Note that you need to install the gem
    -- first
    -- use {'tybenz/vimdeck', opt = true}
    -- use {'godlygeek/tabular', cmd = {'Tabularize'}, opt = true}
    -- use {'rlofc/vorg', ft = {'vorg'}, opt = true}
    -- use {'kana/vim-textobj-user', opt = true}
    -- vim.cmd("Plug 'Julian/vim-textobj-brace'")
    -- vim.cmd("Plug 'glts/vim-textobj-comment'")
    -- use {'ap/vim-css-color'}
    use {'moll/vim-bbye', event = "CursorHold"}
    use {'bronson/vim-visual-star-search', event = "CursorHold"}
    -- vim.cmd("Plug 'ap/vim-buftabline'")
    -- use {'tpope/vim-dispatch', opt = true}
    -- use {'dstein64/vim-startuptime', cmd = {'Startuptime'}, opt = true}
    use {'junegunn/vim-slash', event = "CursorHold"}
    -- use {'prettier/vim-prettier', cmd = {'Prettier'}, opt = true}
    -- use {'ncm2/float-preview.nvim'}
    -- vim.cmd("Plug 'rhysd/git-messenger.vim'")
    -- use {'sebdah/vim-delve', ft = {'go'}, opt = true, disable = true}
    -- Plug 'pechorin/any-jump.nvim'
    -- use {'thaerkh/vim-indentguides', ft = {'c', 'go', 'lua', 'python'}}
    use {'voldikss/vim-floaterm', opt = true, cmd = {'FloatermToggle'}}
    -- vim.cmd("Plug 'nvim-treesitter/nvim-treesitter'")
    -- use {'jpalardy/vim-slime', cmd = {'Slime'}, opt = true}
    -- use {'lambdalisue/fern.vim',  cmd = {'Fern'}, opt = true, config = 'require("plugin_configs.fern")'}
    -- use {'psliwka/vim-smoothie'}
    -- vim.cmd("Plug 'wellle/context.vim', {'on': 'ContextEnable'}")
    use {'neovim/nvim-lspconfig', opt = true, ft = {'go', 'rust'}, config = 'require("plugin_configs.my_lsp")'}
    use {'nvim-lua/completion-nvim', event = "CursorHoldI", config = function() require("plugin_configs.my_completions") end}

    use {'webdevel/tabulous', cmd = {'TabulousRename'}, opt = true, config = function() require("plugin_configs.my_tabulous") end}

    use {'simeji/winresizer', cmd = {'WinResizerStartResize'}, opt = true, config = function() require("plugin_configs.my_winresizer") end}

    use {'vimwiki/vimwiki', cmd = {'VimWiki'}, opt = true, config = function() require("plugin_configs.my_vimwiki") end}

    use {'rust-lang/rust.vim', ft = {'rust'}, opt = true}

    -- use {'cespare/vim-toml', ft = {'toml'}, opt = true}

    -- use {'antoinemadec/FixCursorHold.nvim'}

    -- use {'marcushwz/nvim-workbench', opt = true, cmd = {'<Plug>ToggleProjectWorkbench'}}

    -- use {'sindrets/diffview.nvim', opt = true, cmd = {'DiffviewOpen'}, disable = true}

    use {'kyazdani42/nvim-web-devicons', config = function() require("plugin_configs.my_devicons") end}

    -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua', opt = true, ft = {'go', 'python', 'rust'}, disable = true}

    use {'kyazdani42/nvim-tree.lua', cmd = {'NvimTreeToggle'}, opt = true}

    use {'folke/todo-comments.nvim', cmd = {'TodoQuickFix', 'TodoTelescope'}, config = function() require("plugin_configs.my_todo-comments") end}

    use {'dracula/vim', as = 'dracula'}

    -- use {'vim-scripts/colqer', disable = true}

    use {'arcticicestudio/nord-vim'}

    use {'karb94/neoscroll.nvim', event = "WinScrolled", config = function() require("plugin_configs.my_neoscroll") end}

    use {'skywind3000/asynctasks.vim', cmd = {"AsyncTask", "AsyncTaskEdit", "AsyncTaskMacro", "AsyncTaskList", "AsyncTaskProfile"}, config = function() require("plugin_configs.my_async") end}

    use {'skywind3000/asyncrun.vim', cmd = {"AsyncRun", "AsyncStop"}}

    use {'hoob3rt/lualine.nvim', event = "BufReadPost", config = function() require("plugin_configs.my_lualine") end}

    use {'nightsense/cosmic_latte'}

    use {'junegunn/seoul256.vim'}

end
)
-- vim: set ts=4 sw=4 sts=0 noet :
