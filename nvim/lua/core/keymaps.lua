vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('i', '<C-BS>', '<C-w>', opts)
vim.keymap.set('n', '<Esc>', ':nohl <CR>', opts) -- Esc removes highlights 

-- Keep the cursor in the center of the screen when cycling occurrences searched
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) --vertical split
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) --horizontal split
vim.keymap.set('n', '<leader>se', '<C-w>/', opts) --make splits equal size
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) --close splits

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts)   -- close buffer
vim.keymap.set('n', '<leader>+', '<cmd> enew <CR>', opts) -- new buffer 

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize -2<CR>', opts)
-- vim.keymap.set('n', '<Left>', 'vertical resize -2<CR>', opts)
-- vim.keymap.set('n', '<Right>', 'vertical resize +2<CR>', opts)

-- Navigate between splits
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Stay in visual mode after indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- LSP Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Execute depending on filetype 
vim.keymap.set('n', '<leader>r', function()
    --local filename = vim.fn.expand("%")
    --local basename = vim.fn.expand("%:r")
    local filetype = vim.bo.filetype

    if filetype == "python" then
        print("Python file")
        vim.cmd(":term python3 %")
    else
        print("No interpreter or compiler defined for filetype: '"..filetype.."'")
    end
end)

