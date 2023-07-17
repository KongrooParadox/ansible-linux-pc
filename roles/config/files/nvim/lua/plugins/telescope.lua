return {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function()
                require('telescope').load_extension('fzf')
            end,
        }
    },
    opts = {
        pickers = {
            find_files = {
                find_command = { 'rg', '--color=never', '--files', '--hidden', '--glob', '!**/.git/*' },
            },
        },
    },
}

