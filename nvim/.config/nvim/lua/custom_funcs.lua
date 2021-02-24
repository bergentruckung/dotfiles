-- Window zoom
vim.g.zoomed = false

function Zoom_toggle()
    if vim.g.zoomed then
        vim.cmd("execute " .. "\"" .. vim.g.zoom_restcmd .. "\"")
        vim.g.zoomed = false
    else
        vim.g.zoom_restcmd = vim.fn["winrestcmd"]()
        vim.cmd("resize")
        vim.cmd("vertical resize")
        vim.g.zoomed = true
    end
end

function Set_modeline()
	cms = vim.bo.commentstring
	line_to_insert = cms:gsub("%%s", "")
	modeline_params = string.format(" vim: set ts=%d sw=%d sts=%d %set :", vim.bo.tabstop, vim.bo.shiftwidth, vim.bo.softtabstop, vim.bo.expandtab and "" or "no")
	line_to_insert = line_to_insert .. modeline_params
	vim.fn.append(vim.fn.line("$"), "")
	vim.fn.append(vim.fn.line("$"), line_to_insert)
end
