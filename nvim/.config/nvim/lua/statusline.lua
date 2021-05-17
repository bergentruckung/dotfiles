-- bergentruckung's statusline
local api = vim.api
local M = {}
local devicons = require'nvim-web-devicons'
-- local MODE_TABLE = {}

local current_mode = setmetatable({
      ['n'] = 'Normal',
      ['no'] = 'N·Operator Pending',
      ['v'] = 'Visual',
      ['V'] = 'V·Line',
      ['^V'] = 'V·Block',
      ['s'] = 'Select',
      ['S'] = 'S·Line',
      ['^S'] = 'S·Block',
      ['i'] = 'Insert',
      ['ic'] = 'Insert',
      ['ix'] = 'Insert',
      ['R'] = 'Replace',
      ['Rv'] = 'V·Replace',
      ['c'] = 'Command',
      ['cv'] = 'Vim Ex',
      ['ce'] = 'Ex',
      ['r'] = 'Prompt',
      ['rm'] = 'More',
      ['r?'] = 'Confirm',
      ['!'] = 'Shell',
      ['t'] = 'Terminal'
    }, {
      -- this is required for V-Block mode
      __index = function(_, _)
        return 'V·Block'
      end
    }
)

function get_mode()
    return "[" .. current_mode[api.nvim_get_mode()["mode"]] .. "]"
end


function get_ft_icon()
    local ft = vim.fn.expand('%:e')
    local icon = devicons.get_icon("", ft, options)
    return icon
end


-- function init_mode_table()
--     MODE_TABLE["i"] = "Insert"
--     MODE_TABLE["n"] = "Normal"
--     MODE_TABLE["r"] = "Replace"
--     MODE_TABLE["v"] = "Visual"
--     MODE_TABLE["!"] = "Shell"
--     MODE_TABLE["R"] = "Replace"
--     MODE_TABLE["Rv"] = "V·REPLACE"
--     MODE_TABLE["S"] = "S·Line"
--     MODE_TABLE["V"] = "V·Line"
--     MODE_TABLE["^S"] = "S·Block"
--     MODE_TABLE["^V"] = "V·Block"
--     MODE_TABLE["c"] = "Command"
--     MODE_TABLE["ce"] = "Ex"
--     MODE_TABLE["cv"] = "Vim Ex"
--     MODE_TABLE["i"] = "Insert"
--     MODE_TABLE["ic"] = "Insert"
--     MODE_TABLE["ix"] = "Insert"
--     MODE_TABLE["n"] = "Normal"
--     MODE_TABLE["no"] = "N·Operator Pending"
--     MODE_TABLE["r"] = "Prompt"
--     MODE_TABLE["r?"] = "Confirm"
--     MODE_TABLE["rm"] = "More"
--     MODE_TABLE["s"] = "Select"
--     MODE_TABLE["t"] = "TerminaL"
--     MODE_TABLE["v"] = "Visual"
-- end

function git_branch()
    -- Use fugitive to get current branch name
    local git_br = vim.fn["fugitive#head"]()
    if string.len(git_br) == 0 then
        return ""
    end
    return " " .. git_br
end

-- init_mode_table()


function M.Active()
    if not vim.g.completed_loading_plugins then
        return ""
    end
    local statusline = ""
    -- Left group
    -- LG.mode
    -- uncomment this if you want mode in statusline
    statusline = "%#StatusLineViMode#" .. get_mode()
    -- LG.git_branch
    local git_branch = git_branch()
    if string.len(git_branch) > 0 then
	git_branch = " ⌘" .. git_branch
    end
    local git_hi = "%#StatusLineGit#"
    -- LG.obsession_status

    statusline = statusline .. git_hi .. git_branch .. " " .. "%#StatusLineEmpty#"
    -- Middle group
    local status_hi = "%#StatusLineFilename#"
    -- LG.filename
    -- LG.is_modified
    -- statusline = statusline .. status_hi .. "%=%f %m"
    statusline = statusline .. "%=" .. status_hi .. "%f" .. status_hi .. " %m" .. "%#StatusLineEmpty#"
    -- Right group
    -- RG.readonly
    -- RG.filetype
    -- RG.curr_line
    -- RG.curr_column
    statusline = statusline .. "%=" .. "%#StatusLineFileType#" .. "%y" .. "%#StatusLineEmpty#" .. "%#StatusLineCount#" .. "[%l: %c]"
    return statusline
end

function M.Inactive()
    if not vim.g.completed_loading_plugins then
        return ""
    end
    local statusline = ""
    -- Left group
    -- LG.mode
    -- LG.git_branch
    local git_branch = git_branch()
    if string.len(git_branch) > 0 then
	git_branch = " ⌘" .. git_branch
    end
    local git_hi = "%#StatusLineInactive#"
    -- LG.obsession_status

    statusline = statusline .. git_hi .. git_branch .. "%#StatusLineInactive#"
    -- Middle group
    local status_hi = "%#StatusLineInactive#"
    -- LG.filename
    -- LG.is_modified
    -- statusline = statusline .. status_hi .. "%=%f %m"
    statusline = statusline .. "%=" .. status_hi .. " %f %m" .. "%#StatusLineInactive#"
    -- Right group
    -- RG.readonly
    -- RG.filetype
    -- RG.curr_line
    -- RG.curr_column
    statusline = statusline .. "%=" .. "%#StatusLineInactive#" .. "%y" .. "%#StatusLineInactive#" .. "%#StatusLineInactive#" .. " [%l: %c]"
    return statusline
    
end

return M
