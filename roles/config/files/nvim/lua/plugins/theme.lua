-- Set colorscheme
vim.o.termguicolors = true

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                -- use the night style
                style = "night",
            })
            vim.cmd[[colorscheme tokyonight]]
        end
    },
    {
        'nvim-lualine/lualine.nvim', -- Fancier statusline
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'tokyonight',
                },
            }
        end,
    },
    'nvim-tree/nvim-web-devicons',
}

