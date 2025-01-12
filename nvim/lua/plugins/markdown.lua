return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        init = function()
                local g = vim.g
                g.mkdp_auto_start = 0
                g.mkdp_auto_close = 1
                g.mkdp_refresh_slow = 0
                g.mkdp_command_for_global = 0
                g.mkdp_open_to_the_world = 0
                g.mkdp_open_ip = ''
                g.mkdp_browser = 'chromium'
                g.mkdp_echo_preview_url = 0
                g.mkdp_browserfunc = ''
                g.mkdp_theme = 'dark'
                g.mkdp_filetypes = { "markdown" }
                g.mkdp_page_title = "${name}.md"
                g.mkdp_preview_options = {
                    disable_sync_scroll = 0,
                    disable_filename = 1
                }
            end,
    },
}
