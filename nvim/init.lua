require "core.options"
require "core.keymaps"
require "core.snippets"

vim.g.python3_host_prog = vim.fn.expand('~/.virtualenvs/neovim-env/bin/python')

-- WSL urls and links router
if vim.fn.has("wsl") == 1 then
  vim.g.netrw_browsex_viewer = "wslview"
else

end

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
require "plugins.neotree",
require "plugins.colortheme",
require "plugins.lualine",
require "plugins.treesitter",
require "plugins.telescope",
require "plugins.lsp",
require "plugins.autocompletion",
require "plugins.autoformatting",
require "plugins.gitsigns",
require "plugins.indent-blankline",
require "plugins.misc",
require "plugins.virtualenvs",
require "plugins.debug",
require "plugins.bufferline",
require "plugins.surround",
require "plugins.codecompanion",
require "plugins.alpha",
require "plugins.todo",
require "plugins.markdown",
require "plugins.typst",
})

