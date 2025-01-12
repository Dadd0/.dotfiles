-- Plugins which require no configuration code

return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function ()
            local npairs = require('nvim-autopairs')
            local Rule = require('nvim-autopairs.rule')
            npairs.setup()
            npairs.add_rules({
                Rule('$', '$', 'markdown') -- math mode
            })
            npairs.add_rules({
                Rule('*', '*', 'markdown') -- bold
            })
            npairs.add_rules({
                Rule('_', '_', 'markdown') --italics
            })
        end,
    },
    {
        'tpope/vim-sleuth',
    },
    {
        'tpope/vim-fugitive',
    },
    {
        'tpope/vim-rhubarb',
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function ()
            require('colorizer').setup()
        end,
    }
}
