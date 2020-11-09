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
