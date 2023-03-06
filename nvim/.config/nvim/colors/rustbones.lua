local colors_name = "rustbones"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

vim.cmd[[PackerLoad zenbones.nvim]]
local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.opt.background:get()

-- Define a palette. Use `palette_extend` to fill unspecified colors
-- Based on https://github.com/gruvbox-community/gruvbox#palette
local palette
if bg == "light" then
	palette = util.palette_extend({
		-- bg = hsluv "#e1e1db",
		-- fg = hsluv "#262625",
		-- rose = hsluv "#3b2e2a",
		-- leaf = hsluv "#83c07c",
		-- wood = hsluv "#3b2e2a",
		-- water = hsluv "#076678",
		-- blossom = hsluv "#e69f67",
		-- sky = hsluv "#427b58",
  --   paper = hsluv "#c8c9db",
    bg = hsluv "#e1e1db",
		fg = hsluv "#282828",
		cream = hsluv "#ebdbb2",
		string = hsluv "#c8c9db",
		rose = hsluv "#fb4934",
		leaf = hsluv "#b8bb26",
		wood = hsluv "#fabd2f",
		water = hsluv "#83c07c",
		blossom = hsluv "#e69f67",
		sky = hsluv "#83c07c",
    rust = hsluv "#e69f67",
    comment = hsluv "#afa280",
    dark_brown = hsluv "#3b2e2a",
    crab = hsluv "#e33b26",
    line_nr = hsluv "#b3a497",
    conceal = hsluv "#616161"
	}, bg)
else
	palette = util.palette_extend({
    fg = hsluv "#e1e1db",
		bg = hsluv "#282828",
		cream = hsluv "#ebdbb2",
		string = hsluv "#c8c9db",
		rose = hsluv "#fb4934",
		leaf = hsluv "#b8bb26",
		wood = hsluv "#fabd2f",
		water = hsluv "#83c07c",
		blossom = hsluv "#e69f67",
		sky = hsluv "#83c07c",
    rust = hsluv "#e69f67",
    comment = hsluv "#afa280",
    dark_brown = hsluv "#3b2e2a",
    crab = hsluv "#e33b26",
    line_nr = hsluv "#b3a497",
    conceal = hsluv "#616161"
	}, bg)
end

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function()
	return {
    Comment { fg = palette.dark_brown.lighten(35), bg = palette.bg },
		Statement { bg = base_specs, fg = palette.crab },
		Special { fg = palette.wood },
		Type { fg = palette.rust },
    LineNr { bg = palette.line_nr, fg = palette.bg},
    Visual { bg = palette.rust, fg = palette.bg },
    SpecialComment { Comment },
    Search { Visual },
    String { fg = palette.cream },
    Cursor { bg = palette.string, fg = palette.bg },
    Identifier { fg = palette.fg },
    LineNrAbove { bg = palette.dark_brown, fg = palette.comment },
    LineNrBelow { bg = palette.dark_brown, fg = palette.comment },
    StatusLine { bg = palette.dark_brown, fg = palette.fg },
    Number { fg = palette.string, bg = palette.bg },
    Bool { Number },
    Constant { Number },
    Todo { bg = palette.string, fg = palette.dark_brown, gui = "bold" },
    Function { fg = palette.fg },
    NonText { fg = palette.conceal.lighten(-32) },
    RustModPath { Type }
	}
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
require("zenbones.term").apply_colors(palette)
