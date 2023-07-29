return {
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        }
    },
    {
        'numToStr/Comment.nvim',
        config = true
    },
    {
        'kylechui/nvim-surround',
        config = true
    },
    {
        'ThePrimeagen/harpoon',
        config = function ()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file,
                { desc = '[A]dd file to harpoon list'}
            )
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu,
                { desc = '[E]dit harpoon list'}
            )

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end,
                { desc = 'Go to 1st file in harpoon list'}
            )
            vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end,
                { desc = 'Go to 2nd file in harpoon list'}
            )
            vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end,
                { desc = 'Go to 3rd file in harpoon list'}
            )
            vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end,
                { desc = 'Go to 4th file in harpoon list'}
            )
            vim.keymap.set("n", "<C-;>", function() ui.nav_file(5) end,
                { desc = 'Go to 5th file in harpoon list'}
            )
        end
    },
    'ThePrimeagen/vim-be-good',
    {
        'folke/zen-mode.nvim',
        config = function ()
            vim.keymap.set("n", "<leader>zz", function()
                require("zen-mode").setup {
                    window = {
                        width = 120,
                        options = { }
                    },
                }
                require("zen-mode").toggle()
                vim.wo.wrap = false
                vim.wo.number = true
                vim.wo.rnu = true
            end, {desc = 'Toggle [Z]en Mode'})
        end
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle,
                { desc = 'Toggle [U]ndotree'}
            )
        end,
    },
    'xiyaowong/virtcolumn.nvim',
}
