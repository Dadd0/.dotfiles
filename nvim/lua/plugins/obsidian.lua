vim.pack.add {
  {
    src = "https://github.com/obsidian-nvim/obsidian.nvim",
    version = vim.version.range "*", -- use latest release, remove to use latest commit
  },
  "https://github.com/ibhagwan/fzf-lua",
}

require("obsidian").setup {
  legacy_commands = false, -- this will be removed in 4.0.0
  picker = {
    name = "fzf-lua",
  },
  workspaces = {
    {
      name = "personal",
      path = "~/Desktop/my-notes",
    },
    {
      name = "work",
      path = "~/Desktop/FireGenAI",
    },
  },
}

vim.keymap.set("n", "<leader>o", ":Obsidian<CR>", { desc = "Open Obsidian Management Tool" })

-- Browse the current Obsidian vault with yazi
vim.keymap.set("n", "<leader>oe", function()
	require("yazi").yazi(nil, tostring(Obsidian.dir))
end, { desc = "Explore Obsidian vault (yazi)" })
