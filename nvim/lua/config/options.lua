local opt = vim.opt

opt.number = true --line numbers
opt.relativenumber = true
opt.cursorline = true -- highlight current line
opt.wrap = false -- don't wrap lines
opt.scrolloff = 8

-- INDENTATION
opt.tabstop = 2 -- tab width
opt.shiftwidth = 2 -- indentation width
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- SEARCH SETTINGS
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case sensitive if there are uppercase letters in search
opt.hlsearch = false -- don't highlight search results
opt.incsearch = true -- incremental searc: show matches as you type

-- VISUAL SETTINGS
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmatch = true -- highlight matching brackets
opt.matchtime = 2
opt.cmdheight = 1
-- opt.showmode = false -- don't show mode in command line
opt.pumheight = 10
opt.pumblend = 10 -- popup menu transparency
opt.winblend = 10 -- floating window transparency
opt.ruler = false
opt.virtualedit = "block"
opt.winminwidth = 5

-- FILE HANDLING
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir") -- undo directory
opt.updatetime = 300 -- time to completion
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.ttimeoutlen = 0
opt.autoread = true -- autoreload files changed outside nvim

-- BEHAVIOR SETTINGS
opt.errorbells = false
opt.autochdir = false
opt.encoding = "utf-8"

-- SPLIT BEHAVIOR
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- PERFORMANCE IMPROVEMENTS
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- CREATE UNDO DIRECTORY IF IT DOESN'T EXIST
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

