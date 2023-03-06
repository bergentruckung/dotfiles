local present, telescope = pcall(require, "telescope")
if not present then
    return
end

-- require('telescope').load_extension('fzf')
-- require('telescope').load_extension('file_browser')
-- local previewers = require('telescope.previewers')
local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')
-- local fb_actions = require('telescope._extensions.file_browser.actions')

telescope.setup{
  pickers = {
    find_command = { "fd" },
    find_files = {
      theme = "dropdown",
      layout_config = {
        width = 0.3,
        height = 0.3,
      },
    },
    buffers = {
      theme = "dropdown",
      layout_config = {
        width = 0.3,
        height = 0.3,
      },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
    },
  },
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--trim',
    },
    prompt_prefix = "% ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "vertical",
    layout_config = {
      width = 0.4,
      height = 0.7,
      -- preview_cutoff = 120,
      prompt_position = "top",
    },
    -- file_ignore_patterns = {},
    winblend = 0,
    -- border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    path_display = {
      "relative"
    },
    -- preview = {
    --   filesize_limit = 2,
    --   treesitter = false,
    -- },
    preview = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    -- buffer_previewer_maker = new_maker,
    -- file_previewer = previewers.vim_buffer_cat.new,
    -- grep_previewer = previewers.vim_buffer_vimgrep.new,
    -- qflist_previewer = previewers.vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
        ["<c-c>"] = actions.close,
        ["<M-p>"] = actions_layout.toggle_preview,
      },
      n = {
        ["<c-d>"] = actions.delete_buffer,
        ["<esc>"] = actions.close,
        ["<c-c>"] = actions.close,
      }
    },
  }
}

local M = {}
M.find_nvim_dotfiles = function()
  local opts = {}
  opts.prompt_title = " Nvim configs "
  opts.cwd = vim.fn.stdpath("config")
  require"telescope.builtin".find_files(opts)
end

M.find_dotfiles = function()
  local opts = {}
  opts.prompt_title = " Dotfiles "
  opts.cwd = "~/.dotfiles"
  require"telescope.builtin".find_files(opts)
end

return M
