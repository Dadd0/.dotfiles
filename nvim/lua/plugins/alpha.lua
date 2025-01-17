return {
    "goolord/alpha-nvim",
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
      local dashboard = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      dashboard.section.header.val = {
[[                                                  ]],
[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
[[                                                  ]],
    }
      require("alpha").setup(
        dashboard.config
      )
    end,
  }
