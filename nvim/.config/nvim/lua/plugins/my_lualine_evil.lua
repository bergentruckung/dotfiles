-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#87875f',
  fg       = '#262626',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#af5f5f',
  -- bg = "#262626",
  -- nord
  -- bg = "#4C566A",
  -- fg = "#ECEFF4",
  -- selection = "#44475A",
  -- comment = "#6272A4",
  -- red = "#FF5555",
  -- orange = "#FFB86C",
  -- yellow = "#F1FA8C",
  -- green = "#50fa7b",
  -- purple = "#BD93F9",
  -- cyan = "#8BE9FD",
  -- pink = "#FF79C6",
  -- bright_red = "#FF6E6E",
  -- bright_green = "#69FF94",
  -- bright_yellow = "#FFFFA5",
  -- bright_blue = "#D6ACFF",
  -- bright_magenta = "#FF92DF",
  -- bright_cyan = "#A4FFFF",
  -- bright_white = "#FFFFFF",
  -- bg = "#7f9f7f",
  -- fg = "#313633",
  -- guifg=#313633 guibg=#ccdc90
  -- selection = "#44475A",
  -- comment = "#6272A4",
  -- red = "#FF5555",
  -- orange = "#FFB86C",
  -- yellow = "#F1FA8C",
  -- green = "#50fa7b",
  -- purple = "#BD93F9",
  -- cyan = "#8BE9FD",
  -- pink = "#FF79C6",
  -- bright_red = "#FF6E6E",
  -- bright_green = "#69FF94",
  -- bright_yellow = "#FFFFA5",
  -- bright_blue = "#D6ACFF",
  -- bright_magenta = "#FF92DF",
  -- bright_cyan = "#A4FFFF",
  -- bright_white = "#FFFFFF",
}


local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
    globalstatus = true,
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.bg }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    -- return { fg = mode_color[vim.fn.mode()] }
    return { fg = colors.fg }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = '(No active LSP)'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  -- icon = '',
  color = { fg = colors.fg, gui = 'bold' },
}

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { bg = colors.red, fg = colors.fg },
    color_warn = { bg = colors.blue, fg = colors.fg },
    color_info = { bg = colors.white, fg = colors.fg },
  },
}


-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  'filename',
  -- icon = require'nvim-web-devicons'.get_icon("", vim.bo.filetype, options),
  cond = conditions.buffer_not_empty,
  color = { fg = colors.fg, gui = 'bold' },
}


-- Add components to right sections
-- ins_right {
--   'o:encoding', -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = conditions.hide_in_width,
--   color = { fg = colors.green, gui = 'bold' },
-- }
--
-- ins_right {
--   'fileformat',
--   fmt = string.upper,
--   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--   color = { fg = colors.green, gui = 'bold' },
-- }
--
ins_right {
  'branch',
  icon = '',
  color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  -- symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green, bg = colors.bg },
    modified = { fg = colors.blue, bg = colors.bg },
    removed = { fg = colors.red, bg = colors.bg },
  },
  cond = conditions.hide_in_width,
}

ins_right { 'location' }

ins_right { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.bg },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)

