vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/mikavilpas/yazi.nvim",
})

require("yazi").setup({
	-- open yazi instead of netrw when opening a directory (e.g. `nvim .`)
	open_for_directories = true,
	keymaps = {
		show_help = "<f1>",
	},
})

vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>", { desc = "Open yazi in nvim's working directory" })
vim.keymap.set("n", "<C-Up>", "<cmd>Yazi toggle<cr>", { desc = "Resume the last yazi session" })
