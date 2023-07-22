-- Set colorscheme
vim.o.termguicolors = true

return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("nightfox").setup({
                transparent = true,
            })
            vim.cmd("colorscheme nordfox")
        end
    },
    {
        'nvim-lualine/lualine.nvim', -- Fancier statusline
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'nordfox',
                },
            }
        end,
    },
    'nvim-tree/nvim-web-devicons',
}

