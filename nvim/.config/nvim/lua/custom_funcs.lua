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

function open_vert_terminal()
  vim.cmd("vnew")
  vim.cmd("terminal")
end

function Open_databank()
  vim.cmd("PackerLoad vimwiki")
  vim.cmd("VimwikiIndex")
end

function enable_mkdx()
  vim.cmd("set filetype=markdown")
  vim.cmd("set filetype=vimwiki")
end

function Toggle_venn()
  vim.cmd[[PackerLoad venn.nvim]]
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
      vim.b.venn_enabled = true
      vim.cmd[[setlocal ve=all]]
      -- draw a line on HJKL keystokes
      vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
      vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
      vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
      vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
      -- draw a box by pressing "f" with visual selection
      vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
  else
      vim.cmd[[setlocal ve=]]
      vim.cmd[[mapclear <buffer>]]
      vim.b.venn_enabled = nil
  end
end

function Dirbuf_new_tab()
  vim.cmd[[tabnew]] 
  vim.cmd[[Dirbuf]]
end

function DiffviewToggle()
  if not vim.g.diffview_loaded then
    vim.cmd[[PackerLoad diffview.nvim]]
    vim.g.diffview_loaded = true
  end
	if vim.g.diffview_open then
    vim.cmd[[DiffviewClose]]
		vim.g.diffview_open = false
	else
    vim.cmd[[DiffviewOpen]]
		vim.g.diffview_open = true
	end
end

function ToggleKeymap()
    if vim.o.keymap == "" then
        vim.cmd[[set keymap=colemak]]
        vim.cmd[[set imsearch=0]]
        vim.cmd[[echom "colemak"]]
    else
        vim.cmd[[set keymap=]]
        vim.cmd[[set iminsert=0]]
        vim.cmd[[echom "qwerty"]]
    end
end
