return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        gemini = function ()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = os.getenv("GEMINI_API_KEY")
            }
          })
        end
      },
      strategies = {
        chat = {
          adapter = "gemini"
        },
        inline = {
          adapter = "gemini"
        },
        cmd = {
          adapter = "gemini"
        }
      }
    })
  end
}
