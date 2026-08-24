vim.pack.add({ 'https://github.com/nvim-mini/mini.surround' })

local Surround = require("mini.surround")

Surround.setup( 
{
  custom_surroundings = {
    -- `q` matches any quote (', ", `) as input; outputs ' by default
    q = {
      input = { { "%b''", '%b""', "%b``" }, "^.().*().$" },
      output = { left = "'", right = "'" },
    },
  },

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    add = 'sa', -- Add surrounding in Normal and Visual modes
    delete = 'sd', -- Delete surrounding
    find = '', -- Find surrounding (to the right)
    find_left = '', -- Find surrounding (to the left)
    highlight = '', -- Highlight surrounding
    replace = 'sr', -- Replace surrounding

    suffix_last = '', 
    suffix_next = '', 
  },

  -- Number of lines within which surrounding is searched
  n_lines = 20,

  -- Whether to respect selection type:
  -- - Place surroundings on separate lines in linewise mode.
  -- - Place surroundings on each line in blockwise mode.
  respect_selection_type = false,

  -- How to search for surrounding (first inside current line, then inside
  -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
  -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
  -- see `:h MiniSurround.config`.
  search_method = 'cover',

  -- Whether to disable showing non-error feedback
  -- This also affects (purely informational) helper messages shown after
  -- idle time if user input is required.
  silent = false,
})

vim.keymap.set("n", "cq", "srq", { remap = true, desc = "Change surrounding quotes" })
