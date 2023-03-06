vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local use = packer.use

return packer.startup({function() -- Packer can manage itself as an optional plugin
    -- use {"Pocco81/true-zen.nvim", event = "BufReadPost", config = function() require("plugins.my_true_zen") end}
    -- use {'arcticicestudio/nord-vim'}
    use {'SidOfc/mkdx', opt = true, ft = {"markdown", "md"}}
    use {'f-person/git-blame.nvim', cmd = {'GitBlameToggle'}}
    -- use {'TimUntersberger/neogit', commit = "1843330963cc0299fd453145248681f3d33862b3", cmd = {"Neogit"}, config = function() require("plugins.my_neogit") end}
    use {'TimUntersberger/neogit', cmd = {"Neogit"}, config = function() require("plugins.my_neogit") end}
    -- use {'wincent/command-t', config = function() require("wincent.commandt").setup() end}
    -- use {'anuvyklack/hydra.nvim', requires = 'anuvyklack/keymap-layer.nvim', event = "CursorMoved", config = function() require("plugins.my_hydra") end}
    -- use {'elihunter173/dirbuf.nvim', opt = true, cmd = {'Dirbuf'}, config = function() require("plugins.my_dirbuf") end}
    use {'elm-tooling/elm-vim', ft = {'elm'}}
    use {'danymat/neogen', ft = {"go", "python", "rust"}, opt = true, after = "nvim-treesitter", config = function() require('plugins.my_neogen') end}
    -- use {'folke/todo-comments.nvim', cmd = {'TodoQuickFix', 'TodoTelescope'}, config = function() require("plugins.my_todo-comments") end}
    use {'godlygeek/tabular', cmd = "Tabularize", opt = true}
    -- use {'sainnhe/gruvbox-material'}
    -- use {'hoob3rt/lualine.nvim', config = function() require("plugins.my_lualine_evil") end}
    use {'hrsh7th/nvim-cmp', ft = {"elm", "go", "python", "rust"}, opt = true, config = function() require("plugins.my_nvim-cmp") end}
    use {'hrsh7th/cmp-buffer', ft = {"elm", "go", "python", "rust"}, opt = true}
    use {'hrsh7th/cmp-cmdline', ft = {"elm", "go", "python", "rust"}, opt = true}
    use {'hrsh7th/cmp-nvim-lsp', ft = {"elm", "go", "python", "rust"}, opt = true}
    use {'hrsh7th/cmp-path', ft = {"elm", "go", "python", "rust"}, opt = true}
    -- use {'ibhagwan/fzf-lua', after = "nvim-web-devicons", config = function() require("plugins.my_fzflua") end}
    use {'j-hui/fidget.nvim', ft = {"elm", "go", "python", "rust"}, opt = true, config = function() require("plugins.my_fidget") end}
    use {'jbyuki/venn.nvim', cmd = "VBox", opt = true}
    use {'junegunn/vim-peekaboo'}
    use {'karb94/neoscroll.nvim', config = function() require("plugins.my_neoscroll") end}
    -- use {'kyazdani42/nvim-web-devicons', config = function() require("plugins.my_devicons") end}
    use {'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end}
    use {'lewis6991/impatient.nvim'}
    use {'moll/vim-bbye'}
    -- use {'morhetz/gruvbox', cmd = {"colorscheme"}}
    -- use {'theblob42/drex.nvim', cmd = {'DrexDrawerToggle', 'DrexDrawer'}}
    use {'TimUntersberger/neofs', config = function() require("plugins.my_neofs") end}
    use {'neovim/nvim-lspconfig', opt = true, ft = {"elm", "go", "python", "rust"}, config = 'require("plugins.my_lsp")'}
    use {'numToStr/Comment.nvim', config = function() require("plugins.my_comment-nvim") end}
    -- use {'nvim-treesitter/nvim-treesitter', config = function() require("plugins.my_treesitter") end}
    use {'nvim-treesitter/nvim-treesitter', ft = {"elm", "go", "norg", "python"}, config = function() require("plugins.my_treesitter") end}
    use {'onsails/lspkind-nvim', before = "nvim-cmp"}
    use {'pwntester/octo.nvim', opt = true, cmd = {'Octo'}, config = function() require("plugins.my_octo") end}
    use {'rodjek/vim-puppet', ft = {'puppet', 'epuppet'}, opt = true}
    use {'romgrk/nvim-treesitter-context', after = "nvim-treesitter", opt = true}
    use {'rust-lang/rust.vim', ft = {'rust'}}
    use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', opt = true, config = function() require("plugins.my_diffview") end}
    use {'skywind3000/asyncrun.vim', cmd = {"AsyncRun", "AsyncStop"}}
    use {'skywind3000/asynctasks.vim', cmd = {"AsyncTask", "AsyncTaskEdit", "AsyncTaskMacro", "AsyncTaskList", "AsyncTaskProfile"}, config = function() require("plugins.my_async") end}
    use {'togglebyte/togglerust', ft = {'rust'}}
    use {'tpope/vim-fugitive', cmd = {'Commits'}, opt = true}
    use {'tpope/vim-repeat', opt = true, event = "InsertEnter"}
    use {'tpope/vim-surround', opt = true, event = "InsertEnter"}
    use {'vimwiki/vimwiki', cmd = {'VimWikiIndex'}, opt = true, config = function() require("plugins.my_vimwiki") end}
    -- use {'voldikss/vim-floaterm', opt = true, cmd = {'FloatermToggle', 'FloatermNew'}}
    use {'numToStr/FTerm.nvim', config = function() require("plugins.my_fterm") end}
    use {'wbthomason/packer.nvim'}
    use {'windwp/nvim-autopairs', event = "InsertEnter", config = function() require("plugins.my_autopairs") end}
    use {'junegunn/fzf', after = "fzf.vim"}
    use {'junegunn/fzf.vim'}
    use {'nvim-lua/plenary.nvim'}
    use {'imsnif/kdl.vim'}
    use {'nathanalderson/yang.vim'}
    use {'folke/tokyonight.nvim'}
    use {'gfanto/fzf-lsp.nvim', ft = {'go', 'python', 'rust'}, requires = "plenary.nvim"}
    use {
        'weilbith/nvim-code-action-menu',
        ft = {'go', 'python', 'rust'}, 
        cmd = 'CodeActionMenu',
    }
    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
        config = function() require("nvim-lightbulb").setup({autocmd = {enabled = true}}) end,
    }

    use {
        "nvim-neorg/neorg",
        -- tag = "*",
        ft = "norg",
        after = "nvim-treesitter",
        requires = "plenary.nvim",
        config = function()
            require('plugins.my_neorg')
        end
    }
    use {'wincent/ferret'}
    -- use({
    --   "folke/noice.nvim",
    --   event = "VimEnter",
    --   config = function()
    --     require("plugins.my_noice")
    --   end,
    --   requires = {
    --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --     "MunifTanjim/nui.nvim",
    --     -- OPTIONAL:
    --     --   `nvim-notify` is only needed, if you want to use the notification view.
    --     --   If not available, we use `mini` as the fallback
    --     "rcarriga/nvim-notify",
    --     }
    -- })
    -- use({
    --     "Pocco81/true-zen.nvim",
    --     config = function()
    --          require("true-zen").setup {
    --             -- your config goes here
    --             -- or just leave it empty :)
    --          }
    --     end,
    -- })
    end,
    config = {
      profile = {
        enable = true,
        threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
      }
}})

-- vim: set ts=4 sw=4 sts=0 noet :
