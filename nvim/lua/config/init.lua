require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.commands")
require("config.lsp")
require("config.tabline")
require("config.statusline")

require("vim._core.ui2").enable({
  enable = true,

  msg = {
    targets = "cmd",

    cmd = {
      height = 0.5,
    },

    dialog = {
      height = 0.5,
    },

    msg = {
      height = 0.5,
      timeout = 4000,
    },

    pager = {
      height = 1,
    },
  },
})
