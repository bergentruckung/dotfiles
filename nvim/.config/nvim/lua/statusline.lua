-- bergentruckung's statusline
local api = vim.api
local M = {}
local MODE_TABLE = {}

function get_mode()
    return api.nvim_get_mode()["mode"]
end

function init_mode_table()
    MODE_TABLE["n"] = "NORMAL"
    MODE_TABLE["i"] = "INSERT"
end

function git_branch()
    -- Use fugitive to get current branch name
    local git_br = vim.fn["fugitive#head"]()
    if string.len(git_br) == 0 then
        return ""
    end
    return " " .. git_br .. " "
end

-- init_mode_table()

-- api.nvim_command('hi Obsession guifg='..obsession_fg..' gui='..obsession_gui)

function M.Create()
    if not vim.g.completed_loading_plugins then
        return ""
    end
    local statusline = ""
    -- Left group
    -- LG.git_branch
    local git_branch = git_branch()
    if string.len(git_branch) > 0 then
	git_branch = "%%" .. git_branch
    end
    local git_hi = "%#CusorLineNr#"
    -- LG.obsession_status

    statusline = statusline .. git_hi .. git_branch .. "%#SignColumn#"
    -- Middle group
    local status_hi = "%#CusorLineNr#"
    -- LG.filename
    -- LG.is_modified
    -- statusline = statusline .. status_hi .. "%=%f %m"
    statusline = statusline .. "%=" .. status_hi .. " %f %m" .. "%#SignColumn#"
    -- Right group
    -- RG.readonly
    -- RG.filetype
    -- RG.curr_line
    -- RG.curr_column
    statusline = statusline .. "%=" .. "%#Sneak#" .. "%y" .. "%#SignColumn#" .. "%#Constant#" .. " [%l: %c]"
    return statusline
end

return M
