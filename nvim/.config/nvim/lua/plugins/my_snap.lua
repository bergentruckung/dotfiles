local snap = require'snap'
local fzy = snap.get'consumer.fzf'
local limit = snap.get'consumer.limit'
local producer_file = snap.get'producer.ripgrep.file'
local producer_vimgrep = snap.get'producer.ripgrep.vimgrep'
local producer_buffer = snap.get'producer.vim.buffer'
local producer_oldfile = snap.get'producer.vim.oldfile'
local select_file = snap.get'select.file'
local select_vimgrep = snap.get'select.vimgrep'
local preview_file = snap.get'preview.file'
local preview_vimgrep = snap.get'preview.vimgrep'


-- a custom create function that adds common defaults
local function create(config)
  return snap.create(config, {
    layout = snap.get"layout".bottom,
    views = {preview_file},
    mappings = {
      enter = {"<CR>", "<C-o>"}, -- my custom mapping
    },
  })
end


snap.register.map({'n'}, {'<c-t>'}, create(function ()
  return {
    prompt = 'Files%',
    producer = fzy(producer_file),
    select = select_file.select,
  }
end))

snap.register.map({'n'}, {'<F3>'}, create(function ()
  return {
    prompt = 'Nvim%',
    producer = fzy(producer_file.args({"--hidden"}, "~/.config/nvim/")),
    select = select_file.select,
  }
end))

snap.register.map({'n'}, {'<F8>'}, create(function ()
  return {
    prompt = 'Dotfiles%',
    producer = fzy(producer_file.args({"--hidden"}, "~/.dotfiles/")),
    select = select_file.select,
  }
end))

snap.register.map({'n'}, {'<Leader>/'}, create(function ()
  return {
    prompt = 'Grep%',
    producer = limit(10000, producer_vimgrep.args({"-i"})),
    select = select_vimgrep.select,
    views = {preview_vimgrep}
  }
end))

snap.register.map({'n'}, {'<C-p>'}, create(function ()
  return {
    prompt = 'Buffers%',
    producer = fzy(producer_buffer),
    select = select_file.select,
  }
end))

snap.register.map({'n'}, {'<Leader>p'}, create(function ()
  return {
    prompt = 'Oldfiles%',
    producer = fzy(producer_oldfile),
    select = select_file.select,
  }
end))

snap.register.map({'n'}, {'<Leader>g'}, create(function()
  return {
    prompt = 'GitFiles%',
    producer = fzy(snap.get'producer.git.file'),
    select = snap.get'select.file'.select,
  }
end))

snap.register.map({'n'}, {'<Leader>h'}, create(function()
return {
  prompt = "Help%'",
  producer = fzy(snap.get'producer.vim.help'),
  select = snap.get'select.help'.select,
  views = {snap.get'preview.help'}
}
end))
