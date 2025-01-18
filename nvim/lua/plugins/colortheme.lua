return {
    "shaunsingh/nord.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        vim.g.nord_contrast = true
        vim.g.nord_italic = false
        vim.g.nord_disable_background = true

        require('nord').set()
    end
}
